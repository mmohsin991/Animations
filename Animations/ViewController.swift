//
//  ViewController.swift
//  Animations
//
//  Created by Mohsin on 24/02/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBackground: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.twitterLayer()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func twitterLayer(){
        
        self.imgBackground.image = UIImage(named: "wallpaper")
        self.imgBackground.layer.mask = CALayer()
        
        var mask: CALayer! = self.imgBackground.layer.mask

        mask.contents = UIImage(named: "TwitterLogo").CGImage
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mask.position = CGPoint(x: self.imgBackground.frame.size.width/2, y: self.imgBackground.frame.size.height/2)
        
        // imageView.layer.mask? = mask
        

        
    }
    
    
    func twitterAnimation(){
        
        var mask: CALayer! = self.imgBackground.layer.mask

        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.duration = 1
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        let initalBounds = NSValue(CGRect: mask!.bounds)
        let secondBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 90, height: 90))
        let finalBounds = NSValue(CGRect: CGRect(x: 0, y: 0, width: 1500, height: 1500))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        //self.mask!.addAnimation(keyFrameAnimation, forKey: "bounds")
        
        self.imgBackground.layer.mask.addAnimation(keyFrameAnimation, forKey: "bounds")
    }
    
    @IBAction func twitterAnimation(sender: AnyObject) {
        twitterAnimation()
    }
}

