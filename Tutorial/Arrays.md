
## Arrays
Arrays permitem armazenar dados sequenciais de forma que seja possível acessar cada elemento pelo valor de seu índice.
![Array.png](Array.png)

Para criar um Array em Swift, se utiliza o símbolo [] (Colchetes). Veja o exemplo abaixo de um array de String:
```swift
var nomes: [String] = ["João","Maria","Humberto","Ana"]
```
É possível acessar certos atributos de um array que contém informações relevantes:
```swift
nomes[0]     // --> "João"
nomes[2]     // --> "Humberto"
nomes.count  // --> 4      tem 4 elementos no array
nomes.first! // --> "João" O primeiro elemento do array é João
nomes.last!  // --> "Ana"  O último elemento do array é Ana
```
> O ponto de exclamação em `.first` e `.last` é necessário para converter de opcional para o seu valor, pois o retorno destas propriedades pode ser o valor nulo **nil**. Mais para frente será explicado o que são Opcionais detalhadamente.

**Métodos em arrays**

Arrays em swift não são fixos em seu tamanho e podem ser manipulados quase como acontece em linguagens como javascript e python, onde na verdade o array se redimensiona automaticamente dobrando sua capacidade para acomodar novos elementos.

**append** - Permite adicionar elementos ao final de um array
```swift
var idades: [Int] = [66,23]
idades.append(88)
idades.append(99)

print(idades) // ->  [66,23,88,99]
```

**insert** - Permite adicionar elementos em uma posição específica do array
```swift
var idades: [Int] = [66,23]
idades.insert(88, at: 0)
idades.insert(99, at: 0)

print(idades) // ->  [99,88,66,23]
```
> Veja que para especificar a posição que irá ser inserido, se especifica o parâmetro utilizando `at:`, funções em swift podem possuir tanto parâmetros posicionais como parâmetros nomeados, parecido com python

**sort** - Para ordenar o conteúdo do array
```swift
var numeros: [Int] = [4,7,2,8]
numeros.sort()
print(numeros) // ->  [2,4,7,8]
```

**reverse** - Para inverter a ordem do conteúdo do array
```swift
var numeros: [Int] = [4,7,2,8]
numeros.reverse()
print(numeros) // ->  [8,2,7,4]
```

**shuffle** - Para bagunçar um array aleatoriamente
```swift
var numeros: [Int] = [4,7,2,8]
numeros.shuffle()
print(numeros) // ->  [2,4,8,7] (Cada vez que executar será diferente)
```

.