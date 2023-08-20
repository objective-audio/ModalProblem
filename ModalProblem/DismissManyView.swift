import SwiftUI
struct DismissManyView: View {
    @State var isFirstPresented: Bool = false
    @State var isSecondPresented: Bool = false
    
    var body: some View {
        Button("Show") {
            isFirstPresented = true
            isSecondPresented = true
        }
        .sheet(isPresented: $isFirstPresented) {
            Text("1")
                .sheet(isPresented: $isSecondPresented) {
                    Button("Close All") {
                        // iOS16⭕️、iOS15❌
                        isFirstPresented = false
                    }
                }
        }
        .navigationTitle("Dismiss Many Sheets")
    }
}
