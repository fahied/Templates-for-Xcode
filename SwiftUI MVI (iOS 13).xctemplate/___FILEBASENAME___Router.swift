//___FILEHEADER___

import SwiftUI
import Combine

struct ___VARIABLE_sceneName___Router: View {

    enum ScreenType {
        case alert(title: String, message: String)
    }

    let screen: PassthroughSubject<ScreenType, Never>

    @State private var screenType: ScreenType? = nil
    @State private var isAlertVisible = false

    var body: some View {
        Group {
            alertView()
        }.onReceive(screen, perform: { type in
            self.screenType = type
            switch type {
            case .alert:
                self.isAlertVisible = true
            }
        })
    }
}

// MARK: - Private - Views
private extension ___VARIABLE_sceneName___Router {

    private func alertView() -> some View {
        guard let type = screenType, case .alert(let title, let message) = type else {
            return AnyView(EmptyView())
        }
        return AnyView(Spacer().alert(isPresented: $isAlertVisible, content: {
            Alert(title: Text(title), message: Text(message))
        }))
    }
}
