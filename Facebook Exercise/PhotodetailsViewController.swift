//
//  PhotodetailsViewController.swift
//  Facebook Exercise
//
//  Created by Ashutosh Kumar on 9/27/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class PhotodetailsViewController: UIViewController, UIScrollViewDelegate {
    var pic: UIImage!

    @IBOutlet var scrollview2: UIScrollView!
  
    @IBOutlet var photo: UIImageView!
    
    @IBOutlet weak var done: UIButton!
    
    @IBOutlet var actions: UIImageView!
    
    @IBOutlet var doneimage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview2.delegate = self

        photo.image = pic
        
         scrollview2.contentSize = CGSize(width: 320, height: 572)

        // Do any additional setup after loading the view.
    }

    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        println("Dragging")

       
        self.scrollview2.alpha = 1
        UIView.animateWithDuration(0.6, animations: {
            self.actions.hidden = true
            self.view.backgroundColor  = UIColor.clearColor()
            self.doneimage.hidden = true
            self.scrollview2.alpha = 0.3
            }, completion: {
                (value: Bool) in
        })
        
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
            
println("offset: \(self.scrollview2.contentOffset.y)")
            
            if self.scrollview2!.contentOffset.y <= -60 {
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
   
            else {
            

                
                self.scrollview2.alpha = 0.3
                UIView.animateWithDuration(0.3, animations: {
                    self.actions.hidden = false
                    self.doneimage.hidden = false
                    self.scrollview2.alpha = 1
                    }, completion: {
                        (value: Bool) in
                })

           
            }
            
            
            
            
            
            
            
            
            
            

    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
      
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDone(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)

    }

    
    func viewForZoomingInScrollView(scrollView2: UIScrollView!) -> UIView! {
        return photo
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
