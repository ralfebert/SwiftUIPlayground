// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct CounterView: View {
    let name: String
    @State var count = 1

    var body: some View {
        Button("Counter \(name) \(count)") { self.count += 1 }
            .padding()
            .border(Color.blue)
    }
}

/// Demonstrates that SwiftUI state is coupled to view appearance / disappearance
struct StateExampleView: View {

    @State var showB = false

    var body: some View {
        VStack {

            Toggle(isOn: $showB) {
                Text("Toggle A/B")
            }

            if showB {
                CounterView(name: "B")
            } else {
                CounterView(name: "A")
            }
        }
        .border(Color.red)
        .padding()
    }
}

struct StateExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StateExampleView()
    }
}
