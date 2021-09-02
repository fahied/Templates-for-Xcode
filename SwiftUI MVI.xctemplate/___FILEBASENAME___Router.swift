//___FILEHEADER___

import SwiftUI
import Combine

enum ___VARIABLE_sceneName___RouteScreenType {
    case alert(title: String, message: String?)
    case exit
}

struct ___VARIABLE_sceneName___Router: View {

    let routePublisher: AnyPublisher<___VARIABLE_sceneName___RouteScreenType, Never>

    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        Router(routePublisher: routePublisher) { screen, isVisible in
            switch screen {
            case let .alert(title, message):
                alertView(title: title, message: message, isVisible: isVisible)

            case .exit:
                exit()

            case .none:
                EmptyView()
            }
        }
    }
}

// MARK: - Private - Views

extension ___VARIABLE_sceneName___Router {

    func alertView(title: String, message: String?, isVisible: Binding<Bool>) -> some View {
        var messageText: Text? {
            guard let message = message else { return nil }
            return Text(message)
        }

        return Text("").alert(isPresented: isVisible, content: {
            Alert(title: Text(title), message: messageText, dismissButton: .cancel())
        })
    }

    func exit() -> some View {
        presentationMode.wrappedValue.dismiss()
        return EmptyView()
    }
}

/*

import SwiftUI
import Combine

struct Router<ScreenType,Content>: View where Content: View {

    // MARK: Public

    let routePublisher: AnyPublisher<ScreenType, Never>
    let content: (ScreenType?, Binding<Bool>) -> Content

    // MARK: Private

    @Environment(\.presentationMode) private var presentationMode
    @State private var screenType: ScreenType? = nil

    // MARK: Live cycle

    init(routePublisher: AnyPublisher<ScreenType, Never>,
                @ViewBuilder content: @escaping (ScreenType?,  Binding<Bool>) -> Content) {
        self.routePublisher = routePublisher
        self.content = content
    }

    var body: some View {
        let isVisible: Binding<Bool> = Binding<Bool>(get: { self.screenType != nil },
                                                     set: { if !$0 { screenType = nil } })
        return content(screenType, isVisible)
            .onReceive(routePublisher) { self.screenType = $0 }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
*/
