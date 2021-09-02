//___FILEHEADER___

import SwiftUI

struct ___VARIABLE_sceneName___View: View {

    @StateObject private var container: MVIContainer<___VARIABLE_sceneName___Intent, ___VARIABLE_sceneName___Model>

    private var intent: ___VARIABLE_sceneName___IntentProtocol { container.intent }
    private var properties: ___VARIABLE_sceneName___ModelStatePotocol { container.model }

    var body: some View {
        bodyView()
            .onAppear(perform: intent.viewOnAppear)
            .overlay(routerView())
    }
}

// MARK: - Views

private extension ___VARIABLE_sceneName___View {

    func bodyView() -> some View {
        Text(properties.title)
    }

    func routerView() -> some View {
        ___VARIABLE_sceneName___Router(routePublisher: properties.routerSubject.eraseToAnyPublisher())
    }
}

// MARK: - Builder

extension ___VARIABLE_sceneName___View {
    static func build(data: ___VARIABLE_sceneName___Intent.ExternalData) -> some View {
        let model = ___VARIABLE_sceneName___Model()
        let intent = ___VARIABLE_sceneName___Intent(model: model, externalData: data)
        let container = MVIContainer(intent: intent, model: model)
        let view = ___VARIABLE_sceneName___View(container: container)
        return view
    }
}

#if DEBUG
// MARK: - Previews

struct ___VARIABLE_sceneName___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_sceneName___View.build(data: .init())
    }
}
#endif

/*

import SwiftUI
import Combine

fileprivate class MVIContainer<Intent, Model: ObservableObject>: ObservableObject {

    // MARK: Public

    let intent: Intent
    let model: Model

    // MARK: private

    private var cancellable: Set<AnyCancellable> = []

    // MARK: Life cycle

    init(intent: Intent, model: Model) {
        self.intent = intent
        self.model = model

        model.objectWillChange.sink { [weak self] _ in
            DispatchQueue.main.async { [weak self] in self?.objectWillChange.send() }
        }.store(in: &cancellable)
    }
}
*/
