// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct MenuButtonExampleView: View {

    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .overlay(self.menuButton, alignment: .topTrailing)
    }

    @ViewBuilder var menuButton: some View {
        Menu(
            content: {
                Button(
                    action: {
                        debugPrint("Action")
                    },
                    label: {
                        Label("Action", systemImage: "xmark")
                    }
                )

            },
            label: {
                Button(
                    action: {},
                    label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 30, height: 30)
                            Image(systemName: "ellipsis")
                                .foregroundColor(.white)
                        }
                    }
                )
                .padding(20)
            }
        )
    }

}

struct MenuButtonExampleView_Previews: PreviewProvider {

    static var previewView: some View {
        MenuButtonExampleView()
    }

    static var previews: some View {
        previewView
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
        previewView
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        previewView
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
