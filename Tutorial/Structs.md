O sistema de tipos do Swift é bastante interessante, iremos ver esses principais elementos a seguir:
- struct
- class
- generics



## Structs e Classes

Tanto Struct e classes possuem uma sintaxe que permitem realizar coisas parecidas: 
- Atributos: podem conter atributos mutáveis e constantes. 
- Métodos: tanto classes como structs podem conter métods que lidam com os seus atributos
- Construtor: possuem um método especial chamada **init** que inicializa o objeto
- Podem ser extendidos para expandir as suas funcionalidades além da implementação padrão
- Podem implementar protocolos para prover funcionalidades de certos tipos

Já classes podem fazer coisas além, que structs não podem:
- Herança: Uma classe pode herdar de outra
- É possível checar e interpretar o tipo de uma instância de uma classe em tempo de execução
- Destrutores permitem que uma instância de uma classe libere qualquer recurso que ela possua
- Uma classe pode ser referenciada várias vezes, podendo ser afetada por qualquer um com acesso a uma referência de uma instância

### Diferenças

Porém, há uma série de diferenças entre Structs e Classes, basicamente tudo gira em torno de Structs serem **tipos por valor** e Classes tipos **por referência**

| struct  | class |
|---|---|
| Tipo por Valor  | Tipo por referência |
| **Copiado** quando atribuído | Referência é passada na atribuição |
| Programação Funcional  | Programação Orientada a Objetos |
| Não há Herança  | Possui Herança |
| Construtor `init` implícito para todos os atributos | `init` padrão não inicializa nenhum atributo   |
| Mutabilidade precisa ser informada `mutating` | Sempre mutável |
| Quase tudo no SwiftUI são structs | UIKit utiliza classes |

> De forma geral, na dúvida, utilize `struct`

## Sintaxe

A definição de structs e classes é muito similar. Você pode definir structs com a palavra reservada `struct` e classes com a palavra `class`. 
```swift
struct UmaStruct {
    // definição de atributos e métodos, etc... vem aqui
}
class UmaClasse {
    // definição de atributos e métodos, etc... vem aqui
}
```
E as definições de atributos e métodos seguem as mesmas basicamente as mesmas regras que as definições de variáveis e funções

```swift
class Pessoa {
    var nome: String
    var idade: Int

    init(_ nome: String, _ idade: Int) {
        self.nome = nome
        self.idade = idade
    }

    func exibir() {
        print("Pessoa \(nome) com \(idade) anos de idade.")
    }
}

var pessoa1 = Pessoa("João",55)
var pessoa2 = Pessoa("Maria",43)

pessoa1.exibir()
pessoa2.exibir()
```
Saída:
```
Pessoa João com 55 anos de idade.
Pessoa Maria com 43 anos de idade.
```

No exemplo acima veja que é necessário criar um construtor `init` para que a instância da classe seja criada.

Também, veja que para acessar os atributos, pode-se tanto utilizar o nome do atributo diretamente como também funciona através da palavra reservada `self`, que representa a instância do objeto ao qual o método está executando.

Agora Veja um exemplo de uma Struct sendo utilizada para definir um Tipo que é um ponto no espaço tridimensional, com os métodos necessários para calcular a distância entre dois pontos:
```swift
struct V3 {
    var x: Double = 0.0
    var y: Double = 0.0
    var z: Double = 0.0
    
    func magnitude() -> Double {
        return (x * x + y * y + z * z).squareRoot()
    }
}

var pA = V3(x: 1, y: 2, z: 3)
var pB = V3(x: 5, y: 5, z: 5)

var dist = pA
dist.x -= pB.x
dist.y -= pB.y
dist.z -= pB.z
var distancia = dist.magnitude()

print(distancia)
print(pA)
print(pB)
```
Saída:
```
5.385164807134504
V3(x: 1.0, y: 2.0, z: 3.0)
V3(x: 5.0, y: 5.0, z: 5.0)
````

Primeiramente veja que o construtor `init` não é necessário, pois a struct possui um implícito já pronto para ser utilizado.

Veja que a saída do código exibe o valor de `pA` e `pB` intocados, isto acontece pois quando a linha `var dist = pA` é executada, a variável `dist` recebeu uma **cópia** de `pA`, portanto modificar a variável `dist` não afeta a variável `pA`

isto não ocorreria caso `V3` fosse uma classe, pois iria ser afetada a mesma referência.

> **Cópia no evento da escrita**
>
> Na verdade, o valor de uma struct só é de fato copiado caso seja estritamente necessário, pois seria um desperdício de memória ficar copiando structs por aí sem se preocupar com nada. O que ocorre é que enquanto o conteúdo da struct não for modificado, ela ainda não foi de fato copiada, porém no instante que se **modificar** algum de seus valores, apenas a variável que aplicou esta modificação verá o valor modificado pois será copiado e não será mais o mesmo.

## Métodos em Structs e Mutabilidade

Structs são tipos por **Valor**. basicamente as propriedades de um tipo por valor não podem ser modificadas pelos métodos a não ser que explicitamente informado

Quando uma struct possui métodos que a modificam, é necessário que tais métodos sejam declarados com a palavra reservada `mutating`. O método pode então mutar, isto é, modificar as propriedades da instância, incluindo atribuir o próprio valor `self` para uma nova instância.

```swift
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
```
Saída:
```
Antes V3(x: 0.1, y: 0.6, z: 0.1)
Depois V3(x: 0.16222142113076254, y: 0.9733285267845752, z: 0.16222142113076254)
```

Veja que para atribuir outro valor aos atributos x, y e z da struct, é necessário informar no nome do método a palavra `mutating`.

Outro ponto interessante é que para ser possível modificar uma struct é necessário declarar a variável como `var`, caso a linha fosse `let pA = V3(...` produziria um erro chamar o método que modifica a struct, pois foi definida como uma constante `let`.