//
//  AnimationWithCGPath.swift
//  Animations
//
//  Created by Mohsin on 11/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class AnimationWithCGPath: UIViewController {

    @IBOutlet weak var boat: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(sender: AnyObject) {
        
        
        
        
        let h : CGFloat = 200
        let v : CGFloat = 75
        let path = CGPathCreateMutable()
        var leftright : CGFloat = 1
        var next : CGPoint = self.boat.layer.position
        var pos : CGPoint
        
        CGPathMoveToPoint(path, nil, next.x, next.y)
        
        for i in 0 ..< 4 {
            pos = next
            leftright *= -1
            next = CGPointMake(pos.x+h*leftright, pos.y+v)
            CGPathAddCurveToPoint(path, nil,
            pos.x, pos.y+30,
            next.x, next.y-30,
            next.x, next.y)
        }
        
        // 1st animation
        let anim1 = CAKeyframeAnimation(keyPath:"position")
        anim1.path = path
        anim1.calculationMode = kCAAnimationPaced
        
        
        
        // 2nd animation
        let revs = [0.0, M_PI, 0.0, M_PI]
        let anim2 = CAKeyframeAnimation(keyPath:"transform")
        anim2.values = revs
        anim2.valueFunction = CAValueFunction(name:kCAValueFunctionRotateY)
        anim2.calculationMode = kCAAnimationDiscrete
        
        
        // 3rd animation
        let pitches = [0.0, M_PI/60.0, 0.0, -M_PI/60.0, 0.0]
        let anim3 = CAKeyframeAnimation(keyPath:"transform")
        anim3.values = pitches
        anim3.repeatCount = Float.infinity
        anim3.duration = 0.5
        anim3.additive = true
        anim3.valueFunction = CAValueFunction(name:kCAValueFunctionRotateZ)
        
        
        
        // 4th animation (group)
        let group = CAAnimationGroup()
        group.animations = [anim1, anim2, anim3]
        group.duration = 8
        self.boat.layer.addAnimation(group, forKey:nil)
        CATransaction.setDisableActions(true)
        self.boat.layer.position = next
        
        CAShapeLayer().timeOffset
        
        
    }

}
