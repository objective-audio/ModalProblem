import SwiftUI

struct SheetToAlertView: View {
    @State var isSheetPresented: Bool = false
    @State var isAlertPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                isSheetPresented = true
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            Button("Switch to Alert") {
                isSheetPresented = false
                isAlertPresented = true // 表示されない
            }
        }
        .alert("Alert", isPresented: $isAlertPresented) {
            Button(role: nil, action: {}) { Text("OK") }
        }
        .navigationTitle("Sheet to Alert")
    }
}
