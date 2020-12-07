//___FILEHEADER___

import SwiftUI
import Combine

struct ___FILEBASENAMEASIDENTIFIER___: View {

    enum ScreenType {
        case alert(title: String, message: String)
        case exit
    }
    enum ActionType {
        case dissmissed(screen: ScreenType)
    }

    // MARK: API
    var action: (ActionType) -> Void
    let screen: PassthroughSubject<ScreenType, Never>

    // MARK: Private
    @Environment(\.presentationMode) private var presentationMode
    @State private var screenType: ScreenType? = nil

    // MARK: Live cycle
    var body: some View {
        displayView().onReceive(screen) { self.screenType = $0 }
    }
}

private extension ___FILEBASENAMEASIDENTIFIER___ {

    private func displayView() -> some View {
        let isVisible = Binding<Bool>(get: { screenType != nil }, set: {
            guard !$0 else { return }
            if let type = screenType {
                self.action(.dissmissed(screen: type))
            }
            screenType = nil
        })
        /* OR
        let isVisible = Binding<Bool>(get: { screenType != nil }, set: { if !$0 { screenType = nil } })
         */
        switch screenType {
        case .alert(let title, let message):
            return Spacer().alert(isPresented: isVisible, content: {
                Alert(title: Text(title), message: Text(message))
            }).toAnyView()

        case .exit:
            presentationMode.wrappedValue.dismiss()
            return EmptyView().toAnyView()

        case .none:
            return EmptyView().toAnyView()
        }
    }
}

private extension View {
    func toAnyView() -> AnyView { AnyView(self) }
}

#if DEBUG
struct ___FILEBASENAMEASIDENTIFIER____Previews: PreviewProvider {
    static let routeSubject = PassthroughSubject<___FILEBASENAMEASIDENTIFIER___.ScreenType, Never>()

    static var previews: some View {
        ZStack {
            Color.white

            Button(action: {
                self.routeSubject.send(.alert(title: "Error", message: "Something went wrong"))
            }, label: { Text("Display Screen") })
        }
        .overlay(___FILEBASENAMEASIDENTIFIER___(action: { _ in },screen: routeSubject))
    }
}
#endif
