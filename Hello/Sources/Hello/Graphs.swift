import Foundation

class ElemGrafo<Elem> {
	var value: Elem
	var conns: [Int]

	init(_ v: Elem, conns: Int) {
		self.value = v
		self.conns = [Int](repeating:-1, count: conns)
	}

	var str: String {
		return "\(value)"
	}
}


class Grafo<Elem> {
	var elems: [ElemGrafo<Elem>]
	var conexoes: Int
	init(conexoes: Int) {
		self.elems = [ElemGrafo<Elem>]()
		self.conexoes = conexoes
	}

	func inserir(_ elem: Elem) -> Int {
		self.elems.append(ElemGrafo<Elem>(elem,conns:self.conexoes))
		return self.elems.count-1
	}

	func conectar(_ a: Int, _ b: Int, conn: Int) {
		var elemA = elems[a]
		elemA.conns[conn] = b
	}

	func printar() {
		print("Elementos: \(elems.count), \(conexoes) conns \n")

		for (i,e) in elems.enumerated() {
			print("\(i) \(e.str): ", terminator: "")
			for (i,e) in e.conns.enumerated() {
				if e >= 0 {
					print(elems[e].str,terminator: " ")
				} else {
					print(".",terminator: " ")
				}
			}
			print("")
		}
	}
}

public struct Graphs {
    public static func test() {
        var salas = Grafo<String>(conexoes:4)

		var sala = salas.inserir("Sala")
		var cozinha = salas.inserir("Cozinha")
		var banheiro = salas.inserir("Banheiro")
		var quarto = salas.inserir("Quarto")
		var quintal = salas.inserir("Quintal")

		var N = 0
		var S = 1
		var L = 2
		var O = 3

		salas.conectar(quintal, sala, conn: N)
		salas.conectar(quintal, cozinha, conn: L)

		salas.conectar(cozinha, sala, conn: S)
		salas.conectar(cozinha, quintal, conn: O)

		salas.conectar(sala, quintal, conn: S)
		salas.conectar(sala, quarto, conn: L)
		salas.conectar(sala, cozinha, conn: N)

		salas.conectar(quarto, banheiro, conn: S)
		salas.conectar(quarto, sala, conn: O)

		salas.conectar(banheiro, quarto, conn: N)

		salas.printar()

		var salaAtual = 0
		while true {
			print("Você está em \(salas.elems[salaAtual].str) \n",terminator: ">")

   			if let line = readLine() {
				var salaEscolhida = -1
				if line == "N" { salaEscolhida = salas.elems[salaAtual].conns[N] }
				else if line == "S" { salaEscolhida = salas.elems[salaAtual].conns[S] }
				else if line == "L" { salaEscolhida = salas.elems[salaAtual].conns[L] }
				else if line == "O" { salaEscolhida = salas.elems[salaAtual].conns[O] }
				else {
					print("Deve ser N, S, L ou O")	
				}

				if salaEscolhida < 0 { 
					print("Não pode ir para lá") 
				} else {
					salaAtual = salaEscolhida
				}
			} else {
				break
			}
		}
    }
}