//___FILEHEADER___

import SwiftUI
import Combine

class ___VARIABLE_sceneName___Intent: ObservableObject {

    let model: ___VARIABLE_sceneName___StateModel

    private var displayModel: ___VARIABLE_sceneName___DisplayModel
    private var cancellable: Set<AnyCancellable> = []

    init(model: ___VARIABLE_sceneName___Model) {
        self.model = model
        self.displayModel = model
        cancellable.insert(model.objectWillChange.sink { self.objectWillChange.send() })
    }
}
