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
        SceneView(scene: self.scene, delegate: self.delegate)
            .ignoresSafeArea()
    }

    var scene: SCNScene {
        let scene = SCNScene(named: "art.scnassets/ship.scn")!

        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!

        // animate the 3d object
        ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))

        return scene
    }
}

struct SceneViewExample_Previews: PreviewProvider {
    static var previews: some View {
        SceneViewExample()
    }
}
