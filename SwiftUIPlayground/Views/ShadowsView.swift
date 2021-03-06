// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ShadowsView: View {
    var body: some View {
        Color.yellow
            .ignoresSafeArea()
            .overlay(self.scrollView, alignment: .bottom)
    }

    var scrollView: some View {
        VStack {
            ForEach(1 ... 3, id: \.self) { _ in
                Color.white
                    .frame(height: 100)
                    .cornerRadius(10)
                    .shadow(color: Color.red, radius: 30, x: 0, y: 0)
            }
        }
        .compositingGroup()
        .padding()
        .frame(height: 200, alignment: .top)
    }
}

struct ShadowsView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowsView()
    }
}
