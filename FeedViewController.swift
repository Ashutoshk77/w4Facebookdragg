//
//  FeedViewController.swift
//  Facebook Exercise
//
//  Created by Ashutosh Kumar on 9/6/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var statusB: UIButton!
    @IBOutlet weak var photoB: UIButton!
   
    @IBOutlet weak var checkinB: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var wedding1: UIImageView!

   
    @IBOutlet var t1: UITapGestureRecognizer!
    
    @IBOutlet var t2: UITapGestureRecognizer!
    
    @IBOutlet var t3: UITapGestureRecognizer!
    
    @IBOutlet var t4: UITapGestureRecognizer!
    
    @IBOutlet var t5: UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                   scrollView.contentSize = CGSize(width: 320, height: 1072)
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }


    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        if (isPresenting) {
            return 3
        } else {
            return 0.15
        }
    }

    
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.frame = CGRect(x: 4, y: 194, width: 154, height: 155)
            toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
            
            
            var window = UIApplication.sharedApplication().keyWindow
           
            
            
            
            
            UIView.animateWithDuration(0.4, delay: 0, options: nil, animations: { () -> Void in
                toViewController.view.transform = CGAffineTransformMakeScale(1, 1)
                toViewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
                }, completion: { (finished:Bool) -> Void in
                    transitionContext.completeTransition(true)
            })
        } else {
            
            fromViewController.view.transform = CGAffineTransformMakeScale(0.95, 0.95)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                fromViewController.view.transform = CGAffineTransformMakeScale(0.52, 0.33)

                fromViewController.view.frame = CGRect(x: 4, y: 194, width: 154, height: 155)
                

                }, completion: { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            })
        }
    }

    
    
  
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "photoSegue" {
        var destinationViewController = segue.destinationViewController as PhotodetailsViewController
        destinationViewController.pic = self.wedding1.image

        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        
        }


        
    }


    
    
    

    @IBAction func t1(sender: UITapGestureRecognizer) {
        self.performSegueWithIdentifier("photoSegue", sender: self)
    }

   
    @IBAction func t2(sender: UITapGestureRecognizer) {        self.performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    @IBAction func t3(sender: UITapGestureRecognizer) {
        self.performSegueWithIdentifier("photoSegue", sender: self)

    }
    
    @IBAction func t4(sender: UITapGestureRecognizer) {        self.performSegueWithIdentifier("photoSegue", sender: self)

    }
    
    @IBAction func t5(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("photoSegue", sender: self)

    }
    
    @IBAction func onCheckinB(sender: UIButton) {
        performSegueWithIdentifier("checkin", sender: self)

    }

    @IBAction func onPhotoB(sender: UIButton) {
        
        performSegueWithIdentifier("photoVSegue", sender: self)

    }
    
    @IBAction func onStatusB(sender: UIButton) {
               performSegueWithIdentifier("statusSegue", sender: self)
    }
    /*


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

