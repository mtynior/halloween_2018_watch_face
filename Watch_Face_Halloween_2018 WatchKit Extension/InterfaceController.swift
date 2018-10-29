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
        removeWatchOSTimeLabel()
    }
    
}

extension InterfaceController {
    
    func removeWatchOSTimeLabel() {
        // Do you want to see something spooky? Read this code :P
        guard let fullScreenViewType = NSClassFromString("SPFullScreenView") else {
            return
        }
        
        guard let viewControllers = (((NSClassFromString("UIApplication")?
            .value(forKey: "sharedApplication") as? NSObject)?
            .value(forKey: "keyWindow") as? NSObject)?
            .value(forKey: "rootViewController") as? NSObject)?
            .value(forKey: "viewControllers") as? [NSObject] else {
                return
        }
        
        viewControllers.forEach { controller in
            guard let views = (controller.value(forKey: "view") as? NSObject)?.value(forKey: "subviews") as? [NSObject] else {
                return
            }
            
            views.forEach { view in
                if view.isKind(of: fullScreenViewType) {
                    ((view.value(forKey: "timeLabel") as? NSObject)?
                        .value(forKey: "layer") as? NSObject)?
                        .perform(NSSelectorFromString("setOpacity:"), with: CGFloat(0))
                }
            }
            
        }
        
    }
    
}
