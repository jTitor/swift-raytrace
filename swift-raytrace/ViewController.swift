//
//  ViewController.swift
//  swift-raytrace
//
//  Created by brahe on 8/4/19.
//  Copyright © 2019 brahe. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    //Content outlets:
    //The view that displays the raytracer's rendering.
    @IBOutlet weak var renderView: NSImageView?
    //A text field displaying the app's status.
    @IBOutlet weak var statusLabel: NSTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

