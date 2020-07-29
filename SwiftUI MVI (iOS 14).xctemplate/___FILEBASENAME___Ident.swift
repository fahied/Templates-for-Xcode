//___FILEHEADER___

import SwiftUI
import Combine

class ___VARIABLE_sceneName___Intent: ObservableObject {

    let model: ___VARIABLE_sceneName___Modeling

    private var sceneNameModel: ___VARIABLE_sceneName___Model! { model as? ___VARIABLE_sceneName___Model }
    private var cancellable: Set<AnyCancellable> = []

    init() {
        self.model = ___VARIABLE_sceneName___Model()
        cancellable.insert(sceneNameModel.objectWillChange.sink { self.objectWillChange.send() })
    }
}
