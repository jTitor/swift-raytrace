//
//  CameraController.swift
//  swift-raytrace
//
//  Displays Camera model state as per the attached view, and allows modifying the camera's model state.
//
//  Created by brahe on 8/4/19.
//  Copyright © 2019 brahe. All rights reserved.
//

import Foundation

class CameraController {
    //The view representing the camera model's state.
    var view: CameraModelView
    
    init(inView: CameraModelView) {
        self.view = inView
        
        assert(false, "initializer unimplemented")
    }
}
