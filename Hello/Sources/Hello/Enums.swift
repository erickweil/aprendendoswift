public struct Enums {
	// CaseIterable permite que o enum seja iterável pela static 'allCases'
	public enum Dias : CaseIterable{
		case domingo
		case segunda
		case terca
		case quarta
		case quinta
		case sexta
		case sabado
		
		// Pode conter funções estáticas e locais
		static func qual(_ n:Int) -> Dias {
			switch(n) {
				case 0: return .domingo
				case 1: return .segunda
				case 2: return .terca
				case 3: return .quarta
				case 4: return .quinta
				case 5: return .sexta
				case 6: return .sabado
				default: return .domingo
			}
		}

		// Pode conter membros calculados. Apenas membros calculados
		var indice: Int {
			 switch(self) {
                                case .domingo: return 0
                                case .segunda: return 1
                                case .terca: return 2  
                                case .quarta: return 3 
                                case .quinta: return 4 
                                case .sexta: return 5  
                                case .sabado: return 6 
                        }
		}
	}

	public static func test() {
		print("Teste Enums\n")

		var dia = Dias.segunda
		print("Dia: \(dia), indice: \(dia.indice)")

		dia = Dias.qual(6)
		print("Dia: \(dia), indice: \(dia.indice)")
		
		// Listar os dias pois é CaseIterable
		print("Possíveis dias:")
		for d in Dias.allCases {
			print("\t\(d)")
		}

		// Optional, é um enum
		/*
		enum Optional<T> {
			case none
			case some(T)
		}
		
		Basicamente, podemos ter um valor opcional por ser uma instância
		deste enum, com o valor T que quiser
		*/
		
		// Como seria completo, jeito normal de usar enums:
		let nome: Optional<String> = .some("Erick")
		let sobrenome: Optional<String> = .none

		// O swift facilita com syntatic sugar, onde que ? representa o enum Optional
		let email: String? = "erick@email.com"
		let telefone: String? = nil

		// O valor padrão é nil, sem precisar especificar
		//let endereco: String? //MAS DEU ERRO???
		let endereco: String? = nil

		if nome != .none { print("Nome:\(nome!)") }
		if sobrenome != .none { print("Sobrenome:\(sobrenome!)") }
		if email != .none { print("Email:\(email!)") }

		// Também pode utilizar o if let

		if let safeTelefone = telefone {
			print("Telefone:\(safeTelefone)")
		} else {
			print("Não possui telefone")
		}

		// ?? nil-coalescing operator
		// Funciona mais ou menos igual o || do javascript
		let txtendereco = endereco ?? "Sem Endereço"
		print(txtendereco)

		// ?. Optional Chaining
		// Permite acessar uma propriedade só se existir o optional
		// .count daria erro sem o ?
		print("Número de caracteres no sobrenome:\(sobrenome?.count ?? 0)")
				
	}
}
