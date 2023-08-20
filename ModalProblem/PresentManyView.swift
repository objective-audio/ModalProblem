import SwiftUI
struct PresentManyView: View {
    @State var isFirstPresented: Bool = false
    @State var isSecondPresented: Bool = false
    @State var isThirdPresented: Bool = false
    
    var body: some View {
        Button("Show") {
            isFirstPresented = true
            isSecondPresented = true
            isThirdPresented = true
        }
        .sheet(isPresented: $isFirstPresented) {
            Text("1")
                .sheet(isPresented: $isSecondPresented) {
                    Text("2") // 2階層までは表示される
                        .sheet(isPresented: $isThirdPresented) {
                            Text("3") // 3階層は表示されない
                        }
                }
        }
        .navigationTitle("Presente Many Sheets")
    }
}
