// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

enum NavStep {
    case step1
    case step2
}

class NavModel: ObservableObject {
    @Published var step: NavStep? = .step1
}

struct Page1View: View {

    @EnvironmentObject var navModel: NavModel

    var body: some View {
        VStack(spacing: 20) {
            // Hidden link from Page1 -> Page2 that gets active when model.step is set to .step2
            NavigationLink(destination: Page2View(), tag: NavStep.step2, selection: $navModel.step) {
                EmptyView()
            }
            Text("Page 1")
            Button("Go to Page 2") {
                self.navModel.step = .step2
            }
        }
        .navigationBarTitle("Page 1")
    }

}

struct Page2View: View {

    @EnvironmentObject var navModel: NavModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Page 2")
            Button("Go to Page 1") {
                self.navModel.step = .step1
            }
        }
        .navigationBarTitle("Page 2")
    }

}

/// Example for programmatic navigation using NavigationLink selection
/// inspired by https://stackoverflow.com/questions/59040566/navigationlink-ontapgesture-and-navigation-not-firing-consistently
struct ProgrammaticNavigationExample: View {

    var body: some View {
        NavigationView {
            Page1View()
        }
        .environmentObject(NavModel())
    }

}

struct ProgrammaticNavigationExample_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammaticNavigationExample()
    }
}
