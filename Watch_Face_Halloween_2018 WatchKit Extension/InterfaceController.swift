//
//  InterfaceController.swift
//  Watch_Face_Halloween_2018 WatchKit Extension
//
//  Created by Michal on 29/10/2018.
//  Copyright © 2018 Michal Tynior. All rights reserved.
//

import WatchKit
import Foundation
import SpriteKit

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var scene: WKInterfaceSKScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let watchFace = Halloween2018()
        watchFace.scaleMode = .aspectFill
        self.scene.presentScene(watchFace)
        self.scene.preferredFramesPerSecond = 30
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func didAppear() {
        hideOSTimeLabel()
    }
}
