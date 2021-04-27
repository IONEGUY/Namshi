//
//  MaskFittingView.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import UIKit
import ARKit
import SceneKit

class MaskFittingView: ARSCNView, ARSCNViewDelegate {
    private var faceNode = SCNNode()
    
    private var defaultMask: String = .empty
    
    func setup(_ defaultMask: String) {
        delegate = self
        
        self.defaultMask = defaultMask
        
        configueARSceneView()
    }
    
    private func configueARSceneView() {
        let configuration = ARFaceTrackingConfiguration()
        session.run(configuration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = device else {
            return nil
        }
        
        let faceGeometry = ARSCNFaceGeometry(device: device, fillMesh: true)
        faceNode.geometry = faceGeometry
        updateMask(defaultMask)
        return faceNode
    }
    
    func updateMask(_ mask: String) {
        faceNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: mask)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor,
              let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
            return
        }
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
}
