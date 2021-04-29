// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct CustomAlertView: View {

    @State var alertVisible = false

    var body: some View {
        Button(
            action: {
                self.alertVisible = true
            },
            label: {
                Text("Show Alert")
            }
        )
        .overlay(self.alertView)

    }

    @ViewBuilder var alertView: some View {
        if alertVisible {
            VStack {
                Text("Hello Alert!")
                Button("Ok") {
                    self.alertVisible = false
                }
            }
            .frame(width: 200)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
        }
    }

}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomAlertView()
        }
    }
}
