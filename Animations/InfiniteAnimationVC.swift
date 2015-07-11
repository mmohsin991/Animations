//
//  InfiniteAnimationVC.swift
//  Animations
//
//  Created by Mohsin on 11/07/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class InfiniteAnimationVC: UIViewController {

    @IBOutlet weak var viewAnimated: InfiniteAnimateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func start(sender: UIButton) {
        self.viewAnimated.startAnimation()
        
    }

}


class InfiniteAnimateView: UIView{
    
    func startAnimation(){
        
        let opts = UIViewAnimationOptions.Autoreverse | .Repeat
        let bounds = self.bounds
        
        UIView.animateWithDuration(0.5, delay: 0.0 , options: opts,animations: { () -> Void in
            self.bounds = CGRect(origin: self.frame.origin, size: (CGSize(width: self.frame.size.width + 20, height: self.frame.size.width + 20)))
            
        }) { (bool) -> Void in
            
            self.bounds = bounds
        }
    }
}



