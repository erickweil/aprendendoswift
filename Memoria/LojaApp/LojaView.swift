// Seguindo tutorial azamsharp
// https://www.youtube.com/watch?v=WGiHhnNnXm4

import SwiftUI

struct LojaView: View {
    @ObservedObject var vm: LojaViewModel
    
    @State var mostrarPopup: Bool = false
    @State var popupMessage: String = ""
    var body: some View {
        List(vm.categorias, id: \.id) { item in
            HStack {
                AsyncImage(url: item.image) { image in
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
                
                Text(item.name)
                    .font(.largeTitle)
                    .bold()
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
            
        }
    }
}

struct LojaView_Previews: PreviewProvider {
    static var previews: some View {
        LojaView(vm: LojaViewModel(httpClient: HTTPClient()))
    }
}
