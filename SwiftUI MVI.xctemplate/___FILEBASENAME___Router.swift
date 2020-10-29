//___FILEHEADER___

import SwiftUI
import Combine

struct ___VARIABLE_sceneName___Router: View {

    enum ScreenType {
        case alert(title: String, message: String)
    }

    let screen: PassthroughSubject<ScreenType, Never>

    @State private var screenType: ScreenType? = nil

    var body: some View {
        displayView()
            .onReceive(screen) { self.screenType = $0 }
    }
}

private extension ___VARIABLE_sceneName___Router {

    private func displayView() -> some View {
        let isVisibleScreen = Binding<Bool> { screenType != nil } set: { if !$0 { screenType = nil } }

        switch screenType {
        // Alert
        case .alert(let title, let message):
            return Spacer().alert(isPresented: isVisibleScreen, content: {
                Alert(title: Text(title), message: Text(message))
            }).toAnyView()

        default:
            return EmptyView().toAnyView()
        }
    }
}
