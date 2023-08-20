import SwiftUI

struct SheetToFullScreenView: View {
    @State var isSheetPresented: Bool = false
    @State var isFullScreenPresented: Bool = false
    
    var body: some View {
        Button("Show Sheet") {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            Button("Switch to FullScreen") {
                isSheetPresented = false
                isFullScreenPresented = true
            }
        }
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            Text("Full Screen")
        }
        .navigationTitle("Sheet to FullScreen")
    }
}
