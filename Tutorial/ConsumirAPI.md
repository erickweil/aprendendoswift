# Consumir API

Referências
- Use async/await with URLSession - https://developer.apple.com/videos/play/wwdc2021/10095/
- **azamsharp** Live Stream - Consuming JSON API in SwiftUI App - https://www.youtube.com/watch?v=vF1ayZ1ghrI&pp=ugMICgJwdBABGAHKBQlhemFtc2hhcnA%3D
- https://serialcoder.dev/text-tutorials/swift-tutorials/fetching-remote-data-with-async-await-in-recent-and-older-system-versions/
- https://swiftsenpai.com/swift/async-await-network-requests/

# Consumindo API REST

A ideia é que precisamos baixar os dados da internet, armazenando-os em algum Model.

1. É necessário definir o Model da resposta json que será Recebida
2. Criar a View e ViewModel para exibir os dados do Model
3. Então, realizar o request em si, para o URL

# 1. Definindo o Model

Para exemplificar, irei estar utilizando da API aberta PokéAPI https://pokeapi.co/docs/v2

A ideia é fazer uma View que carrega um Pokemon, pelo seu ID
O link abaixo por exemplo exibe dados do Pokemon bulbasaur
https://pokeapi.co/api/v2/pokemon/1/
```
abilities	[…]
base_experience	64
forms	[…]
game_indices	[…]
height	7
held_items	[]
id	1
is_default	true
location_area_encounters	"https://pokeapi.co/api/v2/pokemon/1/encounters"
moves	[…]
name	"bulbasaur"
order	1
past_types	[]
species	{…}
sprites	
back_default	"https://raw.githubuserco…rites/pokemon/back/1.png"
back_female	null
back_shiny	"https://raw.githubuserco…pokemon/back/shiny/1.png"
back_shiny_female	null
front_default	"https://raw.githubuserco…er/sprites/pokemon/1.png"
front_female	null
front_shiny	"https://raw.githubuserco…ites/pokemon/shiny/1.png"
front_shiny_female	null
other	{…}
versions	{…}
stats	[…]
types	[…]
weight	69
```

O Model pode conter apenas alguns destes dados, porém é necessário que todos os valores definidos no Model existam na resposta, caso contrário produzirá um Erro. (Valores nulos devem ser especificados com tipos Optionals, definidos com ? após o nome do tipo)

Veja o Model apenas com os valores necessários para exibir a foto e nome do Pokemon:
```swift
struct PokemonModel: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let sprites: Sprites
    struct Sprites: Decodable, Hashable {
        let front_default: String
        let back_default: String
    }
}
```

Apenas o Protocolo `Decodable` é realmente necessário, porém com Hashable e Identifiable você já permite que o model seja utilizado em ForEach's e fica mais fácil de integrar com sua interface.

2. Criar o View e ViewModel

```swift

class PokemonViewModel: ObservableObject {
    @Published public var pokemon: PokemonModel? = nil
    
    public init(_ pokemon: PokemonModel?) {
        self.pokemon = pokemon
    }
    
    public func fetchPokemon() {
        
    }
}

fileprivate let pokemonDefault: PokemonModel = PokemonModel(
    id: "Nenhum",
    name: "Nenhum",
    sprites: PokemonModel.Sprites(
        front_default: "Nenhum",
        back_default: "Nenhum"
    )
)

struct PokemonView: View {
    @StateObject var viewModel: PokemonViewModel = PokemonViewModel(nil)
    
    var body: some View {
        let pokemon = viewModel.pokemon ?? pokemonDefault
        VStack {
            Text(pokemon.name)
                .font(.largeTitle)
                .bold()
            AsyncImage(url: URL(string: pokemon.sprites.front_default)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            }
        }
        .padding()
    }
}
```

3. Realizando o Fetch

Agora, devemos fazer com que o fetch das informações aconteça de fato

A view chama o fetchPokemon() em uma task
```swift
struct PokemonView: View {
    @ObservedObject var viewModel: PokemonViewModel
    
    var body: some View {
        let pokemon = viewModel.pokemon ?? pokemonDefault
        VStack {
            Text(pokemon.name)
                .font(.largeTitle)
                .bold()
            AsyncImage(url: URL(string: pokemon.sprites.front_default)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            }
        }
        .padding()
        .task {
            do {
                try await viewModel.fetchPokemon()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
```

E então o ViewModel faz a requisição:

```swift
class PokemonViewModel: ObservableObject {
    enum PokemonError: Error {
        case urlInvalido
        case respostaInvalida
        case impossivelDecodificar
    }
    
    public var pokemonId: Int
    @Published public var pokemon: PokemonModel? = nil
    
    public init(id: Int,pokemon: PokemonModel?) {
        self.pokemonId = id
        self.pokemon = pokemon
    }
    
    public func fetchPokemon() async throws {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)/")
        
        guard let url else {
            throw PokemonError.urlInvalido
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw PokemonError.respostaInvalida
        }
        
        guard let resp = try? JSONDecoder().decode(PokemonModel.self, from: data) else {
            throw PokemonError.impossivelDecodificar
        }
        
        // Aplica a mudança na UI no Main Queue
        DispatchQueue.main.async {
            self.pokemon = resp
        }
    }
}
```