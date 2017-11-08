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
    
    func fadeOut(duration: TimeInterval, delay: TimeInterval, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
    
    func fadeIn(duration: TimeInterval, delay: TimeInterval, completion:((Bool) -> Void)?) {
        UIView.animate(withDuration: duration, delay:delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)
    }
}
