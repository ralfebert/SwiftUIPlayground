// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ButtonExampleView: View {

    @State var text = "Button"

    var body: some View {
        VStack(spacing: 10.0) {
            Button(text) {
                self.text += "!"
            }

            Button(
                action: {
                    self.text += "!"
                }, label: {
                    Text(self.text)
                }
            )
        }
        .padding([.top, .bottom], 10)

    }
}

struct ButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExampleView()
    }
}
