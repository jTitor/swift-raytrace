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

let kDefaultViewportWidth: UInt = 200
let kDefaultViewportHeight: UInt = 100

class CameraModel {
    //TODO: Class needs:
    //Variables:
    // * Camera Position (Vec3, units)
    // * Camera Viewport (Vec2, pixels)
    var viewportWidth: UInt
    var viewportHeight: UInt
    // * Camera FOV (float32, RADIANS). Note that this is not in degrees as with CameraModelView.
    //   * TODO: clamp inFieldOfView to range [float epsilon, 2PI radians].
    //   * Assert fieldOfView after assignment is in range (0, 2PI + epsilon).
    // * Camera near field (float32, units)
    // * Camera far field (float32, units)
    //   * TODO: Assert on set that incoming near/far are valid:
    //     * inNearField > 0 && inFarField > 0 AND
    //     * inNearField > inFarField
    //   * If assert fails, do not modify the property.
    
    //Summary:
    //Class initializer method.
    init() {
        self.viewportWidth = kDefaultViewportWidth
        self.viewportHeight = kDefaultViewportHeight
    }
    
    //Summary:
    //Renders the world visible to the camera,
    //returning the rendered data as a byte array.
    //
    //Requirements:
    //The byte array should be in the following format:
    //  * RGB888 pixels
    //  * Array type == Uint8*
    //  * Array length == sizeof(pixel) * viewport.width * viewport.height
    func renderImage() -> Array<UInt8> {
        //This should perform the actual raytrace.
        let kViewportArea = Int(self.viewportWidth * self.viewportHeight)
        let kBytesPerComponent = 1
        let kComponentsPerPixel = 3
        let kResultLength = kBytesPerComponent * kComponentsPerPixel * kViewportArea
        var result = Array<UInt8>.init()
        result.reserveCapacity(kViewportArea)
        
        //Render pixels in the following order:
        //Rows are written from top to bottom
        for row in (0..<self.viewportHeight).reversed() {
            //With row elements from left to right
            for col in 0..<self.viewportWidth {
                //Float components are in the range [0, 1]
                
                //For the initial dummy implementation,
                //the image should be as follows:
                //Black in the lower left corner
                //Red in the lower right corner
                //Green in the upper left corner
                //Yellow in the upper right corner.
                //The colors should smoothly interpolate
                //between the corner colors.
                let r = Float(col) / Float(self.viewportWidth)
                let g = Float(row) / Float(self.viewportHeight)
                let b = 0.2
                
                let rByte = UInt8(255.99 * r)
                let gByte = UInt8(255.99 * g)
                let bByte = UInt8(255.99 * b)
                result.append(rByte)
                result.append(gByte)
                result.append(bByte)
            }
        }
        
        //Sanity check that all elements were written
        precondition(result.count == kResultLength)
        return result
    }
}
