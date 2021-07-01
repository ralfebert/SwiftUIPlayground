// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct CircularProgressView: View {
    private let lineWidth: CGFloat = 6

    var body: some View {
        Circle()
            .stroke(lineWidth: 6)
            .scaledToFit()
            .opacity(0.3)
            .foregroundColor(Color.gray.opacity(0.5))
            .overlay(Circle()
                .trim(from: 0.0, to: 0.4)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear))
            .overlay(
                Text("Text")
            )

    }
}

struct DashboardView: View {
    var body: some View {
        HStack(spacing: 10) {
            CircularProgressView()
            CircularProgressView()
            CircularProgressView()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DashboardView()
        }
    }
}
