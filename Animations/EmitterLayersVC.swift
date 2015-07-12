//
//  EmitterLayersVC.swift
//  Animations
//
//  Created by Mohsin on 12/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class EmitterLayersVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(sender: UIButton) {
        self.basicEmiterAnimation()
    }
    
    func basicEmiterAnimation(){
        
        // make a gray circle image
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(10,10), false, 1)
        let con = UIGraphicsGetCurrentContext()
        CGContextAddEllipseInRect(con, CGRectMake(0,0,10,10))
        CGContextSetFillColorWithColor(con, UIColor.grayColor().CGColor)
        CGContextFillPath(con)
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // make a cell with that image
        let cell = CAEmitterCell()
        cell.birthRate = 5
        cell.lifetime = 1
        cell.velocity = 100
        cell.contents = im.CGImage
        
        
        let emit = CAEmitterLayer()
        emit.emitterPosition = CGPointMake(30,100)
        emit.emitterShape = kCAEmitterLayerPoint
        emit.emitterMode = kCAEmitterLayerPoints
        
        
        
        
        // advance configuration if u uncomment it
        
//        cell.lifetimeRange = 0.4
//        cell.velocityRange = 20
//        cell.scaleRange = 0.2
//        cell.scaleSpeed = 0.2
//        cell.color = UIColor.blueColor().CGColor
//        cell.greenRange = 0.5
//        cell.greenSpeed = 0.75
//        
        

        
        
//        // advance configuration if u uncomment it
        
        
//        let key = "emitterCells.circle.greenSpeed"
//        let ba = CABasicAnimation(keyPath:key)
//        ba.fromValue = -1.0
//        ba.toValue = 3.0
//        ba.duration = 4
//        ba.autoreverses = true
//        ba.repeatCount = Float.infinity
//        emit.addAnimation(ba, forKey:nil)
        
        
        
//        emit.emitterPosition = CGPointMake(100,25)
//        emit.emitterSize = CGSizeMake(100,100)
//        emit.emitterShape = kCAEmitterLayerLine
//        emit.emitterMode = kCAEmitterLayerOutline
//        cell.emissionLongitude = 3*CGFloat(M_PI)/4
//        
//        
//        
//        
//        let cell2 = CAEmitterCell()
//        cell.emitterCells = [cell2]
//        cell2.contents = im.CGImage
//        cell2.emissionRange = CGFloat(M_PI)
//        cell2.birthRate = 200
//        cell2.lifetime = 0.4
//        cell2.velocity = 200
//        cell2.scale = 0.2
//        cell2.beginTime = 0.04
//        cell2.duration = 0.2
        
        
        
        
        
        // basic
        emit.emitterCells = [cell]
        self.view.layer.addSublayer(emit)
    }

    
    
}
