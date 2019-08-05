//
//  CameraModelView.swift
//  swift-raytrace
//
//  Converts CameraModel rendering data to an NSImage for use by the app's rendering view.
//
//  Created by brahe on 8/4/19.
//  Copyright © 2019 brahe. All rights reserved.
//

import Cocoa

class CameraModelView {
    //TODO: Class needs:
    //Readonly proprerties:
    // * Rendered Output (NSImage).
    // * Camera Position (Vec3, units)
    // * Camera Viewport (Vec2, pixels)
    // * Camera FOV (float, degrees)
    //   * A setting function for this would then take the new value in degrees too.
    // * Camera near field (float, units)
    // * Camera far field (float, units)
    
    var model: CameraModel
    
    init(inModel: CameraModel) {
        self.model = inModel
        
        assert(false, "initializer unimplemented")
    }
    
    //Renders an image from the assigned CameraModel,
    //then converts it to an NSImage.
    func getRender() -> NSImage {
        //Perform the initial render.
        let rawBytes = self.model.renderImage()
        
        //Now create the CGImage...
        //
        //CGImage needs a data provider, which we can generate from
        //func CFDataCreate(_ allocator: CFAllocator!,
        //_ bytes: UnsafePointer<UInt8>!,
        //_ length: CFIndex) -> CFData!
        //in the form ```CFDataCreate(kCFAllocatorDefault, rawBytes, len(rawBytes))```.
        //TODO: prefer coalescing to a result here.
        let cfRawData = CFDataCreate(kCFAllocatorDefault, rawBytes, rawBytes.count)!
        let cfDataProvider = CGDataProvider.init(data: cfRawData)!
        //Use viewport info for image size.
        let imageWidth: Int
        let imageHeight: Int
        
        //Now create our CGImage...
        /*
         CGImage.init(width: imageWidth,
         height: imageHeight,
         bitsPerComponent: Int,
         bitsPerPixel: Int,
         bytesPerRow: Int,
         space: CGColorSpace,
         bitmapInfo: CGBitmapInfo,
         provider: cfDataProvider,
         decode: UnsafePointer<CGFloat>?,
         shouldInterpolate: false,  //Don't interpolate image if non-native size
         intent: CGColorRenderingIntent)
         */
        let cgImage: CGImage
        
        //Now convert that to an NSImage.
        let result = NSImage.init(cgImage: CGImage, size: NSMakeSize(imageWidth, imageHeight))
        
        return result
    }
}
