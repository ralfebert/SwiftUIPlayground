// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

class FlipModel: ObservableObject {
    @Published var flipped = true {
        didSet {
            print("new value for flipped: \(self.flipped)")
            self.counterModel?.counter += 1
        }
    }

    var counterModel: CounterModel?
}

class CounterModel: ObservableObject {
    @Published var counter = 0
}

struct StrangeStateGlitchExampleView: View {

    @StateObject var flipModel = FlipModel()
    @StateObject var counterModel = CounterModel()

    // MARK: - View

    var body: some View {
        VStack(spacing: 10) {
            Button("Toggle value from SwiftUI") {
                self.flipModel.flipped.toggle()
            }
            Button("Toggle value from external thread") {
                DispatchQueue.main.async {
                    self.flipModel.flipped.toggle()
                }
            }
            OtherView(flipModel: self.flipModel)
            Text("Flipped (ExampleView): \(String(describing: flipModel.flipped))")
            Text("Flipped \(self.counterModel.counter) times")
        }
        .onAppear {
            self.flipModel.counterModel = counterModel
        }

    }

}

struct OtherView: View {

    @ObservedObject var flipModel: FlipModel

    var body: some View {
        Text("Flipped (OtherView): \(String(describing: flipModel.flipped))")
    }
}

struct StrangeStateGlitchExampleView_Previews: PreviewProvider {

    static var previews: some View {
        StrangeStateGlitchExampleView()
    }
}
