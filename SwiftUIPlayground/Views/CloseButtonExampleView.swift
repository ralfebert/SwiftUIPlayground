// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import Foundation
import SwiftUI

struct CloseButtonExampleView: View {

    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .overlay(self.closeButton, alignment: .topTrailing)
    }

    @ViewBuilder var closeButton: some View {
        Button(
            action: {},
            label: {
                ZStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            }
        )
        .padding(20)
        .ignoresSafeArea()
    }

}

struct CloseButtonExampleView_Previews: PreviewProvider {

    static var previewView: some View {
        CloseButtonExampleView()
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
