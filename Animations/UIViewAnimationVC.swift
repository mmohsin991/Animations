//
//  UIViewAnimationVC.swift
//  Animations
//
//  Created by Mohsin on 11/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class UIViewAnimationVC: UIViewController {

    @IBOutlet weak var v: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func kayFrameAnimation(sender: AnyObject) {
    
        self.KeyFrameAnimation()
    }

    
    
    // book code pg: 157
    func KeyFrameAnimation(){
        
        var p = self.v.center
        let dur = 0.25
        var start = 0.0
        let dx : CGFloat = 100
        let dy : CGFloat = 50
        var dir : CGFloat = 1
        UIView.animateKeyframesWithDuration(4,
            delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear,
            animations: {
            UIView.addKeyframeWithRelativeStartTime(start,
            relativeDuration: dur,
            animations: {
            p.x += dx*dir; p.y += dy
            self.v.center = p
            })
            start += dur; dir *= -1
            UIView.addKeyframeWithRelativeStartTime(start,
            relativeDuration: dur,
            animations: {
            p.x += dx*dir; p.y += dy
            self.v.center = p
            })
            start += dur; dir *= -1
            UIView.addKeyframeWithRelativeStartTime(start,
            relativeDuration: dur,
            animations: {
            p.x += dx*dir; p.y += dy
            self.v.center = p
            })
            start += dur; dir *= -1
            UIView.addKeyframeWithRelativeStartTime(start,
            relativeDuration: dur,
            animations: {
            p.x += dx*dir; p.y += dy
            self.v.center = p
            })
            }, completion: nil)
    }

}
