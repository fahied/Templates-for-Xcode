//___FILEHEADER___

import SwiftUI

struct ___VARIABLE_sceneName___View: View {

    @ObservedObject private var intent: ___VARIABLE_sceneName___Intent

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .overlay(___VARIABLE_sceneName___Router(screen: intent.model.routerSubject))
    }

    static func build() -> some View {
        let model = ___VARIABLE_sceneName___Model()
        let intent = ___VARIABLE_sceneName___Intent(model: model)
        let view = ___VARIABLE_sceneName___View(intent: intent)
        return view
    }
}

#if DEBUG
// MARK: - Previews
struct ___VARIABLE_sceneName___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_sceneName___View.build()
    }
}
#endif
