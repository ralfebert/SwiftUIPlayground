// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct ActivityIndicatorView: View {

    @State private var progress = 0.5

    var body: some View {

        VStack(spacing: 20) {
            ProgressView()
            ProgressView(value: progress)

            Button("More") {
                withAnimation {
                    progress += 0.05
                }
            }
        }

    }

}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
