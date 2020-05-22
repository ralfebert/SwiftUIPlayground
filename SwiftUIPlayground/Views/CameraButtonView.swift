// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct CameraButtonView: View {

    @State var recording = true

    var body: some View {

        ZStack {
            Circle()
                .stroke(lineWidth: 8)
                .foregroundColor(.white)
                .frame(width: 65, height: 65)

            RoundedRectangle(cornerRadius: recording ? self.innerCircleWidth / 2 : 8)
                .foregroundColor(.white)
                .frame(width: self.innerCircleWidth, height: self.innerCircleWidth)

        }
        .animation(.linear(duration: 0.2))
        .padding()
        .onTapGesture {
            withAnimation {
                self.recording.toggle()
            }
        }

    }

    var innerCircleWidth: CGFloat {
        recording ? 52 : 32
    }
}

struct CameraButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            CameraButtonView(recording: false)
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(Color.gray)

            CameraButtonView(recording: true)
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(Color.gray)

            ZStack {
                Image("turtlerock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack {
                    Spacer()
                    CameraButtonView()
                }
            }
        }
    }
}
