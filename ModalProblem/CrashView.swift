import SwiftUI

private enum Item: Identifiable {
    case one
    case two
    case three
    
    var id: Self { self }
    
    var text: String {
        switch self {
        case .one:
            return "one"
        case .two:
            return "two"
        case .three:
            return "three"
        }
    }
}

struct CrashView: View {
    @State private var item: Item? = nil
    
    var body: some View {
        Button("Crash") {
            item = .one
            Task {
                try await Task.sleep(for: .milliseconds(100))
                item = .two
                try await Task.sleep(for: .microseconds(100))
                item = .three // クラッシュする
            }
        }
        .sheet(item: $item, content: { modal in
            Text("Modal \(modal.text)")
        })
        .navigationTitle("Crash")
    }
}
