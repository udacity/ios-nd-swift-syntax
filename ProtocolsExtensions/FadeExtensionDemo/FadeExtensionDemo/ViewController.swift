//
//  ViewController.swift
//  FadeExtensionDemo
//
//  Created by Gabrielle Miller-Messner on 6/26/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Actions
    
    @IBAction func sunRiseAndSet(sender: AnyObject) {
        // Fade out
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.imageView.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                if (self.imageView.image == UIImage(named: "sunrise")) {
                    self.imageView.image = UIImage(named:"sunset")!
                } else {
                    self.imageView.image = UIImage(named:"sunrise")!
                }
                
                // Fade in
                UIView.animateWithDuration(1.0, delay:0.0, options:UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.imageView.alpha = 1.0
                    }, completion: nil)
        })
    }
}
