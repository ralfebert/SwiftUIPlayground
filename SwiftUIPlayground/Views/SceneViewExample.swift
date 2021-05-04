// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SceneKit
import SwiftUI

class RendererDelegate: NSObject, ObservableObject, SCNSceneRendererDelegate {

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        print(renderer.currentViewport.size)
    }

}

struct SceneViewExample: View {

    @StateObject var delegate = RendererDelegate()

    var body: some View {
        SceneView(scene: SCNScene(named: "art.scnassets/ship.scn")!, delegate: self.delegate)
            .ignoresSafeArea()
    }
}

struct SceneViewExample_Previews: PreviewProvider {
    static var previews: some View {
        SceneViewExample()
    }
}
