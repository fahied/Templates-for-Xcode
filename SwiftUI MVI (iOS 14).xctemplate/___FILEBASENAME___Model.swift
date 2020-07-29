//___FILEHEADER___

import SwiftUI
import Combine

protocol ___VARIABLE_sceneName___Modeling {
    /* var structAttribute: String { get } */

    var routerSubject: PassthroughSubject<___VARIABLE_sceneName___Router.ScreenType, Never> { get }
}

class ___VARIABLE_sceneName___Model: ObservableObject, ___VARIABLE_sceneName___Modeling {
    /* With enum of states */
    //enum StateType {
    //    case exampleState
    //}

    /* @Published private(set) var structAttribute: String = "" */

    let routerSubject = PassthroughSubject<___VARIABLE_sceneName___Router.ScreenType, Never>()

    /* With enum of states */
    //func update(state: StateType) {
    //    switch state {
    //    case .exampleState:
    //        break
    //    }
    //}
}
