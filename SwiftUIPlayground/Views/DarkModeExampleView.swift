// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct DarkModeExampleView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Button("Hello") {
                print("button tapped")
            }
            .buttonStyle(LightButtonStyle())

            Text("\(String(describing: colorScheme))")
        }
    }
}

/// Reusable Button style
struct LightButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .border(Color("ButtonBorder"))
    }
}

struct DarkModeExampleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DarkModeExampleView()
            }
            .environment(\.colorScheme, .light)

            NavigationView {
                DarkModeExampleView()
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
