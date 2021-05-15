// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static let defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SizeReaderView: View {

    var body: some View {
        GeometryReader { geometry in
            Color.clear.preference(
                key: SizePreferenceKey.self,
                value: geometry.size
            )
        }
    }
}

struct SizePreferenceExampleView: View {

    @State var text = "Lorem ipsum"
    @State var size: CGSize = .zero

    var body: some View {
        VStack {
            Button(
                action: {
                    self.text = Array(repeating: "Lorem ipsum", count: Int.random(in: 1 ... 10)).joined(separator: " ")
                },
                label: {
                    Text(self.text)
                        .padding()
                }
            )
            .background(SizeReaderView())
            .background(Color.yellow)
            .frame(maxWidth: 200)

            Text(String(describing: self.size))
                .frame(width: self.size.width, height: self.size.height)
                .background(Color.green)

        }
        .onPreferenceChange(SizePreferenceKey.self) { size in
            self.size = size
        }
    }

}

struct SizePreferenceExampleView_Previews: PreviewProvider {

    static var previews: some View {
        SizePreferenceExampleView()
    }
}
