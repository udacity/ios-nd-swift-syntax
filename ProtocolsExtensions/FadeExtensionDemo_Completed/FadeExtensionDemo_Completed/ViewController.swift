//
//  ViewController.swift
//  FadeExtensionDemo_Completed
//
//  Created by Gabrielle Miller-Messner on 7/14/15.
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
        imageView.fadeOut(1.0, delay: 0.0, completion: {
            (finished: Bool) -> Void in
            
            //Once the imageView is invisible, set the image property to a new value
            if (self.imageView.image == UIImage(named: "sunrise")) {
                self.imageView.image = UIImage(named:"sunset")!
            } else {
                self.imageView.image = UIImage(named:"sunrise")!
            }
            
            // Then fade the image back in
            self.imageView.fadeIn(1.0, delay: 0.0, completion: nil)
        })
    }
}