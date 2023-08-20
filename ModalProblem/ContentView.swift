import SwiftUI

enum DetailKind {
    case presentManySheets
    case dismissManySheets
    case sheetToFullScreen
    case sheetToAlert
    case freeze
    case crash
}

struct ContentView: View {
    @State var path: [DetailKind] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Present Many Sheets") {
                    path = [.presentManySheets]
                }
                Button("Dismiss Many Sheets") {
                    path = [.dismissManySheets]
                }
                Button("Sheet to FullScreen") {
                    path = [.sheetToFullScreen]
                }
                Button("Sheet to Alert") {
                    path = [.sheetToAlert]
                }
                Button("Freeze") {
                    path = [.freeze]
                }
                Button("Crash") {
                    path = [.crash]
                }
            }
            .navigationDestination(for: DetailKind.self) { kind in
                switch kind {
                case .presentManySheets:
                    PresentManyView()
                case .dismissManySheets:
                    DismissManyView()
                case .sheetToFullScreen:
                    SheetToFullScreenView()
                case .sheetToAlert:
                    SheetToAlertView()
                case .freeze:
                    FreezeView()
                case .crash:
                    CrashView()
                }
            }
            .navigationTitle("Modal Probrem")
        }
    }
}
