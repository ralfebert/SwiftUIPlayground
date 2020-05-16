// SwiftUIPlayground

import SwiftUI

/// Some UIKit view that wants to have a specific size
class YellowBoxUIKitView : UIView {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}

struct YellowBoxView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> YellowBoxUIKitView {
        // TODO: How do you pass the size from UIKit up to SwiftUI?
        YellowBoxUIKitView()
    }
    
    func updateUIView(_ uiView: YellowBoxUIKitView, context: Context) {
    }
    
}

struct SizedUIViewRepresentableView: View {
    var body: some View {
        YellowBoxView()
    }
}

struct SizedUIViewRepresentableView_Previews: PreviewProvider {
    static var previews: some View {
        SizedUIViewRepresentableView()
    }
}
