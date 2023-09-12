// Seguindo tutorial azamsharp
// https://www.youtube.com/watch?v=WGiHhnNnXm4
// Api Store
// fakeapi.platzi.com/docs

import SwiftUI

struct LojaView: View {
    @ObservedObject var vm: LojaViewModel
    
    @State var mostrarPopup: Bool = false
    @State var popupMessage: String = ""
    var body: some View {
        List(vm.categorias, id: \.id) { categoria in
            NavigationLink {
                LojaProdutosView(vm: LojaProdutosViewModel(httpClient: vm.httpClient, categoria: categoria))
            } label: {
                HStack {
                    AsyncImage(url: categoria.image) { image in
                        image.resizable()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .circular))
                    } placeholder: {
                        ZStack {
                            Color.gray
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .circular))
                    }
                    
                    Text(categoria.name)
                        .font(.largeTitle)
                        .bold()
                }
            }
        }.task {
            do {
                try await vm.carregarCategorias()
            } catch {
                print("Erro: \(error.localizedDescription)")
                popupMessage = error.localizedDescription
                mostrarPopup = true
            }
        }.alert(popupMessage, isPresented: $mostrarPopup ) {
            
        }.navigationTitle("Loja")
    }
}

struct LojaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LojaView(vm: LojaViewModel(httpClient: HTTPClient()))
        }
    }
}
