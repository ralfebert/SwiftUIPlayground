// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct TextFieldExampleView: View {

    @State var value = "123"

    var body: some View {
        VStack {
            Text("TextField")
            TextField("Value", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("SecureField")
            SecureField("Value", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct TextFieldExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExampleView()
    }
}
