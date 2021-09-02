//___FILEHEADER___

import SwiftUI
import Combine


import SwiftUI

class ___VARIABLE_sceneName___Intent {

    private let model: ___VARIABLE_sceneName___ModelActionsProtocol
    private let routeModel: ___VARIABLE_sceneName___ModelRouteProtocol
    private let externalData: ExternalData

    init(model: (___VARIABLE_sceneName___ModelActionsProtocol & ___VARIABLE_sceneName___ModelRouteProtocol),
         externalData: ExternalData) {
        self.externalData = externalData
        self.model = model
        routeModel = model
    }
}

// MARK: - API

extension ___VARIABLE_sceneName___Intent: ___VARIABLE_sceneName___IntentProtocol {

    func viewOnAppear() {
        model.update(title: "Hello, World!")
    }
}

// MARK: - Helper classes

extension ___VARIABLE_sceneName___Intent {
    struct ExternalData {}
}
