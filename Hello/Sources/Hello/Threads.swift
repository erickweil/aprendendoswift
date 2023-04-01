/**
    GCD
    1. get access to a queue
    2. exec code on a queue

    Main Queue 'UI'
        DispatchQueue.main
    Background 'non-UI' Queue
        DispatchQueue.global(qos: QoS)
        DispatchQueue(global: .userInitiated)

    DispatchQoS.QoSClass: .userInteractive .userInitiated .utility .background

    let queue = DispatchQueue.main or  DispatchQueue.global(qos: QoS)
    queue.async { /* code */ }
    queue.sync { /* code */ }
*/

import Foundation

public struct Threads {

    public static func test() {
        print("aperte enter para terminar...\n")
        //testAsync()
        //testGroup()

        testRace()
  
        if let _ = readLine() {
            print("Ok.")
        }
    }

    // Condição de corrida, alterar o mesmo valor em diferentes threads
    // Dá erro aleatoriamente
    public static func testRace() {
        var numeros = [Int](repeating: 0, count: 1000)
        
        //let queue = DispatchQueue.global(qos: .background)
        
        print("Inicio")
        DispatchQueue.concurrentPerform(iterations: 1000) { k in
            for i in 0...numeros.count-1 {
                //queue.sync {
                    numeros[i] = k
                //}
            }
        }
        print("Fim")

        for i in 0...numeros.count-1 {
            print(numeros[i], terminator: (i % 20) == 0 ? "\n" : ", ")
        }
    }

    public static func testGroup() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .background)
        
        print("Inicio do teste")

        for _ in 1...10 {
            group.enter()
            queue.async {
                dormirAleatorio()
                group.leave()
            }
        }

        group.wait()
        print("Terminou todos")
    }

    public static func testAsync() {
        let queue = DispatchQueue.global(qos: .background)
        print("Inicio do teste")
        queue.async {
            dormirAleatorio()
        }
        queue.async {
            dormirAleatorio()
        }
        queue.async {
            dormirAleatorio()
        }
        print("Fim do teste")
    }

    public static func dormirAleatorio() {
        let rdn = Int.random(min:0,max: 3000)
        usleep(UInt32(rdn*1000))

        print("Terminou de dormir \(Int(rdn)) ms")
    }
}

public extension Int {
    static var random: Int {
        return Int.random(n: Int.max)
    }

    static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }

    static func random(min: Int, max: Int) -> Int {
        return Int.random(n: max - min + 1) + min
    }
}

public extension Double {
    static var random: Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }

    static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}
