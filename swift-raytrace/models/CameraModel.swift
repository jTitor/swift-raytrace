//
//  CameraModel.swift
//  swift-raytrace
//
//  Stores app state on a single camera instance.
//
//  Created by brahe on 8/4/19.
//  Copyright © 2019 brahe. All rights reserved.
//

import Foundation

class CameraModel {
    //TODO: Class needs:
    //Variables:
    // * Camera Position (Vec3, units)
    // * Camera Viewport (Vec2, pixels)
    // * Camera FOV (float, RADIANS). Note that this is not in degrees as with CameraModelView.
    // * Camera near field (float, units)
    // * Camera far field (float, units)
    
    init() {
        
    }
    
    //Renders the world visible to the camera,
    //returning the rendered data as a byte array.
    //
    //The byte array should be in the following format:
    //  * RGBA8888 pixels
    //  * Array type == Uint8*
    //  * Array length == sizeof(pixel) * viewport.width * viewport.height
    func renderImage() -> Array<UInt8> {
        assert(false, "function unimplemented")
        
        //This should perform the actual raytrace.
    }
}
