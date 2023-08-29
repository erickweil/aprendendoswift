# Multithreading

Referências
- https://www.youtube.com/watch?v=eNS5EzgK3lY&t=871s

Multithreading em aplicações se resume a:

## **NÃO TRAVE A INTERFACE**

A ideia é que **Nunca** deve bloquear a aplicação em tarefas lentas, como baixar uma imagem da internet na thread principal, pois isto impedirá a interface de funcionar e o resultado é uma aplicação que não responde.

Então, como que é possível realizar estas operações que podem levar vários milissegundos ou mesmo até segundos para acontecer sem travar a interface? 

**Executamos estas tarefas em outra thread de execução**

## Threads

A maioria dos sistemas operacionais modernos (incluindo iOS) permitem que você escolha em qual thread executar o seu código. Estas threads então executam o código de forma onde que um não impede a outra de trabalhar (Podendo além de ser de forma concorrente, podem sim executar paralelamente quando num aparelho com vários núcleos no processador).

Você como programador nem se preocupa com todos esses detalhes, apenas deve dizer que deve executar em outra thread e qual a prioridade necessária.

## Queues (Filas)

O desafio é fazer código multithread fácil de ler, entender e escrever. Com Queues você consegue agendar um trecho de código que deve ser executados em algum momento do futuro próximo.

Você não irá lidar com Threads diretamente, apenas agendando trechos de código em Queues.

Há vários Queues que podemos utilizar
- Main Queue

Este é o Queue principal da aplicação, sendo que apenas aqui é permitido modificar a UI (é um erro afetar a UI fora do Main Queue)

Além disso, este Main Queue é executado em uma única Thread, portanto não há preocupações com condições de corrida nem problemas de multithreading no main queue, mas se um dos trechos demorar muito para executar todos os outros ficarão esperando, travando a inteira aplicação.

> Utilizar o main queue é como compartilhar um único banheiro com muitas pessoas. Se alguém demorar de mais todo mundo vai ficar com raiva.

- Background Queues

Tem vários "Background Queues", e você pode agendar uma tarefa para ser executada neste Queue sempre que for algo que demorar alguns milissegundos ou mesmo mais tempo (Como ler um arquivo do disco ou baixar algo da internet). 

Há vários níveis de qualidade (Quality of Service) que podem ser utilizados para priorizar o quão urgente que é executar este seu trecho de código
- .userInteractive A interface depende disso, então faça rápido
- .userInitiated O usuário acabou de pedir para fazer isso
- .utility Isto precisa acontecer, mas foi iniciado automaticamente
- .background Tarefas manutenção (limpeza, etc...)

## GCD (Grand Central Dispatch)

É com o GCD que iremos estar agendando os trechos de código. Veja abaixo uma tarefa em background que chama um código que afeta a interface no main Queue

Vamos entender em detalhes como utilizar multithreading

O código necessário para utilizar queues é primeiro escolher um Queue que deve ser executado:
```swift 
// Main Queue
let queue = DispatchQueue.main
// Background Queue
let queue = DispatchQueue.global(qos: .userInitiated)
```

Então definir se irá executar o trecho de código de forma síncrona ou assíncrona em relação a onde este trecho será executado, as vezes você pode precisar chamar o queue principal e apenas depois de executar este código continuar no background.

**Asíncrono**
```swift
// Executar um código no queue principal de forma assíncrona
let queue = DispatchQueue.main.async {
    // Este código irá executar no queue principal
}
// Aqui será executado **antes** do trecho dentro as chaves
```

**Síncrono**
```swift
// Executar um código no queue principal de forma síncrona
let queue = DispatchQueue.main.sync {
    // Este código irá executar no queue principal
}
// Aqui será executado apenas depois de finalizado o código do trecho dentro das chaves
```

> Não faz sentido no queue principal chamar um queue background, mas executar de forma síncrona com **sync**, pois irá travar a UI do mesmo jeito

## Exemplo em uma View


```swift
// View Model
class PostagensViewModel: ObservableObject {
    // Published para que ao mudar atualize o View
    @Published var postagens: [Postagem] = []

    func fetchPostagens() async throws { 
        /*
        TAREFA LENTA
        */  
        let respModel = try await fetch(/*exemplificando apenas, aqui teria um url seilá*/)

        // Aplica a mudança na UI no Main Queue
        DispatchQueue.main.async {
            self.postagens = respModel.resposta
        }
    }
}

// View
struct PostagemListView: View {
     @StateObject var viewModel = PostagensViewModel()
     var body: some View {
        ForEach(postagens, id: \.self) { postagem in
            PostagemView(postagem: postagem)
        }
        .listStyle(PlainListStyle())
        .task {
            do {
                try await viewModel.fetchPostagens()
            } catch {
                print(error.localizedDescription)
            }
        }
     }
}
```
> Utilizando .task para executar algo no background, cancelando esta tarefa caso a view desapareça antes da tarefa terminar. Basicamente o código dentro do .task { } **já está em um queue background**

