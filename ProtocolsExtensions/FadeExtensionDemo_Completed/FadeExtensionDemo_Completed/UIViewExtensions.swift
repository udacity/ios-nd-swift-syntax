//
//  UIViewExtensions.swift
//  FadeExtensionDemo_Completed
//
//  Created by Gabrielle Miller-Messner on 7/14/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIView (Extensions)

extension UIView {
    
    func fadeOut(duration: NSTimeInterval, delay: NSTimeInterval, completion: ((Bool) -> Void)?) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
    
    func fadeIn(duration: NSTimeInterval, delay: NSTimeInterval, completion:((Bool) -> Void)?) {
        UIView.animateWithDuration(duration, delay:delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)
    }
}