import SwiftUI

struct FreezeView: View {
    @State var isFirstPresented: Bool = false
    @State var isSecondPresented: Bool = false
    
    var body: some View {
        Button("Freeze") {
            isFirstPresented = true
            isSecondPresented = true
            
            Task {
                try await Task.sleep(for: .milliseconds(10))
                isFirstPresented = false
            }
        }
        .sheet(isPresented: $isFirstPresented) {
            Text("First Modal")
                .sheet(isPresented: $isSecondPresented) {
                    Text("Second Modal")
                }
        }
        .navigationTitle("Freeze")
    }
}
