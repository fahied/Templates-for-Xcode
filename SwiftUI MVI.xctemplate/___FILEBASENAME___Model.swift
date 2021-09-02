//___FILEHEADER___

import SwiftUI
import Combine

class ___VARIABLE_sceneName___Model: ObservableObject, ___VARIABLE_sceneName___ModelStatePotocol {

    @Published var title: String = "empty"

    let routerSubject = PassthroughSubject<___VARIABLE_sceneName___RouteScreenType, Never>()
}

// MARK: - Actions Protocol

extension ___VARIABLE_sceneName___Model: ___VARIABLE_sceneName___ModelActionsProtocol {

    func update(title: String) {
        self.title = title
    }
}

// MARK: - Route Protocol

extension ___VARIABLE_sceneName___Model: ___VARIABLE_sceneName___ModelRouteProtocol {

    func routeToAlert(title: String, message: String?) {
        routerSubject.send(.alert(title: title, message: message))
    }

    func exit() {
        routerSubject.send(.exit)
    }
}
