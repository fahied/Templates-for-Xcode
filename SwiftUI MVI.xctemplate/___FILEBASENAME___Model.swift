//___FILEHEADER___

import SwiftUI
import Combine

protocol ___VARIABLE_sceneName___StateModel {
    var isLoading: Bool { get }
    var routerSubject: PassthroughSubject<___VARIABLE_sceneName___Router.ScreenType, Never> { get }
}

protocol ___VARIABLE_sceneName___DisplayModel {
    func dispalyLoading()
}

// MARK: - ___VARIABLE_sceneName___Model & ___VARIABLE_sceneName___StateModel
class ___VARIABLE_sceneName___Model: ObservableObject, ___VARIABLE_sceneName___StateModel {

    @Published private(set) var isLoading: Bool = true

    let routerSubject = PassthroughSubject<___VARIABLE_sceneName___Router.ScreenType, Never>()
}

// MARK: - ___VARIABLE_sceneName___DisplayModel
extension ___VARIABLE_sceneName___Model: ___VARIABLE_sceneName___DisplayModel {

    func dispalyLoading() {
        isLoading = true
    }
}
