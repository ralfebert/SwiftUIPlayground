// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct NavigationContentView: View {

    @Environment(\.presentationMode) var presentationMode
    @State var programmaticNavigationExampleSheetVisible = false

    var body: some View {
        VStack(spacing: 15.0) {
            Text("Example Content")
            NavigationLink(destination: NavigationContentView()) {
                Text("Navigate to other page")
            }
            Button("Go Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
            Button("Programmatic Navigation Example") {
                self.programmaticNavigationExampleSheetVisible = true
            }
        }
        .sheet(isPresented: $programmaticNavigationExampleSheetVisible, content: { ProgrammaticNavigationExample()
        })
        .navigationBarTitle("Content")
    }

}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavigationContentView()
        }
    }
}
