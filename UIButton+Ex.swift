//
//  UIButton+Extension.swift
//
//  Created by Augus on 2/6/16.
//  Copyright © 2016 iAugus. All rights reserved.
//

import UIKit


extension UIButton {
    
    // Do NOT change these default values, many of my projects are using this function.
    func hideAndDisableButton(_ hidden: Bool = true, duration: TimeInterval = 0.3, delay: TimeInterval = 0, animated: Bool = false, closure: Closure? = nil) {
        
        isEnabled = !hidden
        
        // do not just pass it to closure even if the delay is 0.
        if !animated {
            let `do` = {
                self.isHidden = hidden
                closure?()
            }
            
            if delay == 0 {
                `do`()
            } else {
                executeAfterDelay(delay, closure: { 
                    `do`()
                })
            }
            
        } else {
            UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut], animations: {
                self.alpha = hidden ? 0 : 1
                }, completion: { (finished) in
                    if finished {
                        self.isHidden = hidden
                        self.alpha = 1
                        closure?()                        
                    }
            })
        }
    }
}

extension UIButton {
    
    func simulateHighlight(interval i: TimeInterval = 0.15) {
        isHighlighted = true
        DispatchQueue.main.asyncAfter(deadline: .now() + i, execute: { [weak self] in
            self?.isHighlighted = false
        })
    }
}
