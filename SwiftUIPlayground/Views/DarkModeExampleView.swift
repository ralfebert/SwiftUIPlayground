// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct DarkModeExampleView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Button(
                action: {
                    print("Button Tapped")
                },
                label: {
                    HStack {
                        Image(systemName: "tag.fill")
                        Text("Tickets")
                    }
                }
            )
            .buttonStyle(LightButtonStyle())
        }
        .navigationBarTitle("\(String(describing: colorScheme))")
    }

}

/// Reusable Button style
struct LightButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            configuration.label
                .font(.headline)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color("ButtonColor")))
        }
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
