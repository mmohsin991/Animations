//
//  MyLayerVC.swift
//  Animations
//
//  Created by Mohsin on 10/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class MyLayerVC: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
//        let lay1 = CALayer()
//        lay1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1).CGColor
//        lay1.frame = CGRectMake(113, 111, 132, 194)
//        self.view.layer.addSublayer(lay1)
//        let lay2 = CALayer()
//        lay2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).CGColor
//        lay2.frame = CGRectMake(41, 56, 132, 194)
//        lay1.addSublayer(lay2)
//        let lay3 = CALayer()
//        lay3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor
//        lay3.frame = CGRectMake(43, 197, 160, 230)
//        self.view.layer.addSublayer(lay3)
        
        
        
        let myLayer = MyLayer()
        myLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        myLayer.setNeedsDisplay()
        self.myView.layer.addSublayer(myLayer)
        
        
                
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


class MyLayer: CALayer {
    
    
    
    override func drawInContext(ctx: CGContext!) {
            println(ctx)
//            
//            let colors = [UIColor.greenColor().CGColor, UIColor.redColor().CGColor]
//            
//            //2 - set up the color space
//            let colorSpace = CGColorSpaceCreateDeviceRGB()
//            
//            //3 - set up the color stops (0.....1) colors locations == # of colors
//            let colorLocations:[CGFloat] = [0.0, 1.0]
//            
//            //4 - create the gradient
//            let gradient = CGGradientCreateWithColors(colorSpace,
//                colors,
//                colorLocations)
//            
//            //5 - draw the gradient
//            var startPoint = CGPoint.zeroPoint
//            var endPoint = CGPoint(x:0, y:self.bounds.height)
//            CGContextDrawLinearGradient(ctx,
//                gradient,
//                startPoint,
//                endPoint,
//                0)
//
//        
//            self.contentsGravity = kCAGravityCenter
//            
//            
            
            
            
            
            // the gradient
            
            
            let center = CGPoint(x: self.bounds.origin.x + self.bounds.size.width/2, y: self.bounds.origin.y + self.bounds.size.height/2)
            
            let g = CAGradientLayer()
            g.contentsScale = UIScreen.mainScreen().scale
            g.frame = self.bounds
            g.colors = [
                    UIColor.blackColor().CGColor as AnyObject,
                    UIColor.redColor().CGColor as AnyObject
            ]
            g.locations = [0.0,1.0]
            self.addSublayer(g)
            // the circle
            let circle = CAShapeLayer()
            circle.contentsScale = UIScreen.mainScreen().scale
            circle.lineWidth = 2.0
            circle.fillColor = UIColor(red:0.9, green:0.95, blue:0.93, alpha:0.9).CGColor
            circle.strokeColor = UIColor.grayColor().CGColor
            let p = CGPathCreateMutable()
            CGPathAddEllipseInRect(p, nil, CGRectInset(self.bounds, 3, 3))
            circle.path = p
            self.addSublayer(circle)
            circle.bounds = self.bounds
            circle.position = center
            // the four cardinal points
            let pts = "NESW"
            for (ix,c) in enumerate(pts) {
                    let t = CATextLayer()
                    t.contentsScale = UIScreen.mainScreen().scale
                    t.string = String(c)
                    t.bounds = CGRectMake(0,0,40,40)
                    t.position = center
                    let vert = circle.bounds.midY / t.bounds.height
                    t.anchorPoint = CGPointMake(0.5, vert)
                    // println(t.anchorPoint)
                    t.alignmentMode = kCAAlignmentCenter
                    t.foregroundColor = UIColor.blackColor().CGColor
                    t.setAffineTransform(
                    CGAffineTransformMakeRotation(CGFloat(ix)*CGFloat(M_PI)/2.0))
                    circle.addSublayer(t)
            }
            // the arrow
            let arrow = CALayer()
            arrow.contentsScale = UIScreen.mainScreen().scale
            arrow.bounds = CGRectMake(0, 0, 40, 100)
            arrow.position = center
            arrow.anchorPoint = CGPointMake(0.5, 0.8)
            arrow.delegate = self // we will draw the arrow in the delegate method
            arrow.setAffineTransform(CGAffineTransformMakeRotation(CGFloat(M_PI)/5.0))
            self.addSublayer(arrow)
            arrow.setNeedsDisplay() // draw, please
        
        
        
        
        
        
    }
    
    

}

