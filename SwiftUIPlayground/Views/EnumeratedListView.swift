// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import Foundation
import SwiftUI

// see https://stackoverflow.com/a/67132409/128083

struct Light: Identifiable {
    var id: Int
    var active: Bool = false
}

class HomeModel: ObservableObject {
    @Published var lights = (1 ... 5).map { Light(id: $0) }
}

struct EnumeratedListView: View {

    @StateObject var homeModel = HomeModel()

    var body: some View {
        Form {
            ForEach(self.homeModel.lights.indexed(), id: \.element.id) { idx, light in
                Toggle("Light \(light.id)", isOn: $homeModel.lights[idx].active)
            }
        }
    }

}

struct EnumeratedList_Previews: PreviewProvider {
    static var previews: some View {
        EnumeratedListView()
    }
}
