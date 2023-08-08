// A ideia é mostrar como definir Structs
struct V3 {
    var x: Double = 0.0
    var y: Double = 0.0
    var z: Double = 0.0
    
    func magnitude() -> Double {
        return (x * x + y * y + z * z).squareRoot()
    }

    mutating func normalizar() {
        let mag = self.magnitude()
        self.x /= mag
        self.y /= mag
        self.z /= mag
    }
}

var pA = V3(x: 0.1, y: 0.6, z: 0.1)

print("Antes \(pA)")

pA.normalizar()

print("Depois \(pA)")