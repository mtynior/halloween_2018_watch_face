//
//  InterfaceController_TimeLabel.swift
//  Watch_Face_Halloween_2018 WatchKit Extension
//
//  Created by Michal on 20/10/2020.
//  Copyright © 2020 Michal Tynior. All rights reserved.
//

import Foundation

// Thanks to:
// https://github.com/steventroughtonsmith/SpriteKitWatchFace/pull/27
// https://github.com/kuglee/TermiWatch/blob/8bcf4af5465c2d8822067ae4d85bfec45727f85a/TermiWatch%20WatchKit%20Extension/InterfaceController.swift

extension InterfaceController {
    func hideOSTimeLabel() {
        if #available(watchOS 7, *) {
            hideTimeLabelOnWatchOS7()
        } else if #available(watchOS 6, *) {
            hideTimeLabelOnWatchOS6()
        }
        
        return
    }
    
    func hideTimeLabelOnWatchOS7() {
        let application = NSClassFromString("PUICApplication") as? NSObject.Type
        application?.sharedPUICApplication()?._setStatusBarTimeHidden(true, animated: false)
    }
    
    func hideTimeLabelOnWatchOS6() {
        let sel = Selector(("timeText"))
        guard let cls = NSClassFromString("CLKTimeFormatter"),
              cls.instancesRespond(to: sel),
              let method = class_getInstanceMethod(cls, sel) else {
            return
        }
        
        let implBlock : @convention(block) (AnyObject) -> NSString = { (_) -> (NSString) in " " }
        method_setImplementation(method, imp_implementationWithBlock(implBlock))
    }
    
}

// watchOS 6 or later
private extension NSObject {
    @objc class func sharedPUICApplication() -> NSObject? { fatalError() }
    @objc func _setStatusBarTimeHidden(_ hidden: Bool, animated: Bool, completion: NSObject? = nil) { fatalError() }
}
