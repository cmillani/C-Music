//
//  ViewController.swift
//  C#
//
//  Created by Kevin Ferreira Silva on 07/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, LoadViewControllerDelegate{
    @IBOutlet weak var backrgroundImage: UIImageView!
    @IBOutlet weak var colectionImage: UIImageView!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var collectionButton: UIButton!
    var positionControl = 1
    var path1 = UIBezierPath()
    var path2 = UIBezierPath()
    var path3 = UIBezierPath()
    var path4 = UIBezierPath()
    var path5 = UIBezierPath()
    var path6 = UIBezierPath()
    var path7 = UIBezierPath()
    var path8 = UIBezierPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        self.collectionButton.hidden = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "swipeLeft:")
        swipeLeft.numberOfTouchesRequired = 1
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        swipeRight.numberOfTouchesRequired = 1
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
//        self.path1.moveToPoint(CGPoint(x: 360, y: 870))
        self.path1.addCurveToPoint(CGPoint(x: 235, y: 845), controlPoint1: CGPoint(x: 320, y: 865), controlPoint2: CGPoint(x: 270, y: 855))
        
//        self.path2.moveToPoint(CGPoint(x: 235, y: 845))
        self.path2.addCurveToPoint(CGPoint(x: 380, y: 820), controlPoint1: CGPoint(x: 270, y: 825), controlPoint2: CGPoint(x: 320, y: 835))
        
//        self.path3.moveToPoint(CGPoint(x: 380, y: 820))
        self.path3.addCurveToPoint(CGPoint(x: 485, y: 845), controlPoint1: CGPoint(x: 410, y: 825), controlPoint2: CGPoint(x: 440, y: 835))
        
//        self.path4.moveToPoint(CGPoint(x: 485, y: 845))
        self.path4.addCurveToPoint(CGPoint(x: 360, y: 870), controlPoint1: CGPoint(x: 400, y: 850), controlPoint2: CGPoint(x: 440, y: 860))
        
//        self.path5.moveToPoint(CGPoint(x: 360, y: 870))
        self.path5.addCurveToPoint(CGPoint(x: 485, y: 845), controlPoint1: CGPoint(x: 400, y: 860), controlPoint2: CGPoint(x: 440, y: 850))
        
//        self.path6.moveToPoint(CGPoint(x: 485, y: 845))
        self.path6.addCurveToPoint(CGPoint(x: 380, y: 820), controlPoint1: CGPoint(x: 410, y: 835), controlPoint2: CGPoint(x: 440, y: 825))
        
//        self.path7.moveToPoint(CGPoint(x: 380, y: 820))
        self.path7.addCurveToPoint(CGPoint(x: 235, y: 845), controlPoint1: CGPoint(x: 340, y: 825), controlPoint2: CGPoint(x: 300, y: 830))
        
//        self.path8.moveToPoint(CGPoint(x: 235, y: 845))
        self.path8.addCurveToPoint(CGPoint(x: 360, y: 870), controlPoint1: CGPoint(x: 270, y: 855), controlPoint2: CGPoint(x: 325, y: 862))
        
    }
    
    @IBAction func OpenExistent(sender: AnyObject) {
//        var screen = RecordViewController()
        self.performSegueWithIdentifier("firstLoader", sender: self)

        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if (segue.identifier == "firstLoader")
        {
            var destination = segue.destinationViewController as! LoadViewController
            destination.delegate = self
        }
    }
    func loadSelectedPartiture(partitura: Partitura)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var newView = storyboard.instantiateViewControllerWithIdentifier("Teste") as! RecordViewController
        var rootViewController = self.view.window!.rootViewController
        rootViewController!.presentViewController(newView, animated: false) { () -> Void in
            newView.loadSelectedPartiture(partitura)
        }
        
    }
    func swipeLeft(recognizer: UISwipeGestureRecognizer)
    {
        if(self.positionControl == 1)
        {
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.newImage.transform = CGAffineTransformMakeScale(0.6, 0.6)
                let anim = CAKeyframeAnimation(keyPath: "position")
                anim.path = self.path1.CGPath
                anim.duration = 1.0
                anim.rotationMode = kCAAnimationLinear
                anim.repeatCount = 0
                self.newImage.center = CGPoint(x: 283, y: 905)
                self.newImage.layer.addAnimation(anim, forKey: "animate position along path")
                
                self.colectionImage.transform = CGAffineTransformMakeScale(1.4, 1.4)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path3.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 540, y: 905)
                self.colectionImage.layer.addAnimation(anim3, forKey: "animate position along path")
                })
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.newImage.transform = CGAffineTransformMakeScale(0.3, 0.3)
                let anim2 = CAKeyframeAnimation(keyPath: "position")
                anim2.path = self.path2.CGPath
                anim2.duration = 1.0
                anim2.rotationMode = kCAAnimationLinear
                anim2.repeatCount = 0
                self.newImage.center = CGPoint(x: 404, y: 850)
                self.newImage.layer.addAnimation(anim2, forKey: "animate position along path")
                
                self.colectionImage.transform = CGAffineTransformMakeScale(2, 2)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path4.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 400, y: 920)
                self.colectionImage.layer.addAnimation(anim3, forKey: "animate position along path")
            })
            self.positionControl = 2
            self.collectionButton.hidden = false
            self.newButton.hidden = true
        }
        else
        {
            self.positionControl = 1
            self.collectionButton.hidden = true
            self.newButton.hidden = false
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.colectionImage.transform = CGAffineTransformMakeScale(1.4, 1.4)
                let anim = CAKeyframeAnimation(keyPath: "position")
                anim.path = self.path1.CGPath
                anim.duration = 1.0
                anim.rotationMode = kCAAnimationLinear
                anim.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 283, y: 905)
                self.colectionImage.layer.addAnimation(anim, forKey: "animate position along path")
                
                self.newImage.transform = CGAffineTransformMakeScale(0.6, 0.6)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path3.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.newImage.center = CGPoint(x: 540, y: 905)
                self.newImage.layer.addAnimation(anim3, forKey: "animate position along path")
            })
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.colectionImage.transform = CGAffineTransformMakeScale(1, 1)
                let anim2 = CAKeyframeAnimation(keyPath: "position")
                anim2.path = self.path2.CGPath
                anim2.duration = 1.0
                anim2.rotationMode = kCAAnimationLinear
                anim2.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 404, y: 850)
                self.colectionImage.layer.addAnimation(anim2, forKey: "animate position along path")
                
                self.newImage.transform = CGAffineTransformMakeScale(1, 1)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path4.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.newImage.center = CGPoint(x: 400, y: 920)
                self.newImage.layer.addAnimation(anim3, forKey: "animate position along path")
            })
        }
    }
    
    func swipeRight(recognizer: UISwipeGestureRecognizer)
    {
        if(self.positionControl == 1)
        {
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.newImage.transform = CGAffineTransformMakeScale(0.6, 0.6)
                let anim = CAKeyframeAnimation(keyPath: "position")
                anim.path = self.path5.CGPath
                anim.duration = 1.0
                anim.rotationMode = kCAAnimationLinear
                anim.repeatCount = 0
                self.newImage.center = CGPoint(x: 540, y: 905)
                self.newImage.layer.addAnimation(anim, forKey: "animate position along path")
                
                self.colectionImage.transform = CGAffineTransformMakeScale(1.4, 1.4)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path7.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 283, y: 905)
                self.colectionImage.layer.addAnimation(anim3, forKey: "animate position along path")
            })
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.newImage.transform = CGAffineTransformMakeScale(0.3, 0.3)
                let anim2 = CAKeyframeAnimation(keyPath: "position")
                anim2.path = self.path6.CGPath
                anim2.duration = 1.0
                anim2.rotationMode = kCAAnimationLinear
                anim2.repeatCount = 0
                self.newImage.center = CGPoint(x: 404, y: 850)
                self.newImage.layer.addAnimation(anim2, forKey: "animate position along path")
                
                self.colectionImage.transform = CGAffineTransformMakeScale(2, 2)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path8.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 400, y: 920)
                self.colectionImage.layer.addAnimation(anim3, forKey: "animate position along path")
            })
            self.positionControl = 2
            self.collectionButton.hidden = false
            self.newButton.hidden = true
        }
        else
        {
            self.positionControl = 1
            self.collectionButton.hidden = true
            self.newButton.hidden = false
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.colectionImage.transform = CGAffineTransformMakeScale(1.4, 1.4)
                let anim = CAKeyframeAnimation(keyPath: "position")
                anim.path = self.path5.CGPath
                anim.duration = 1.0
                anim.rotationMode = kCAAnimationLinear
                anim.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 540, y: 905)
                self.colectionImage.layer.addAnimation(anim, forKey: "animate position along path")
                
                self.newImage.transform = CGAffineTransformMakeScale(0.6, 0.6)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path7.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.newImage.center = CGPoint(x: 283, y: 905)
                self.newImage.layer.addAnimation(anim3, forKey: "animate position along path")
            })
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.colectionImage.transform = CGAffineTransformMakeScale(1, 1)
                let anim2 = CAKeyframeAnimation(keyPath: "position")
                anim2.path = self.path6.CGPath
                anim2.duration = 1.0
                anim2.rotationMode = kCAAnimationLinear
                anim2.repeatCount = 0
                self.colectionImage.center = CGPoint(x: 404, y: 850)
                self.colectionImage.layer.addAnimation(anim2, forKey: "animate position along path")
                
                self.newImage.transform = CGAffineTransformMakeScale(1, 1)
                let anim3 = CAKeyframeAnimation(keyPath: "position")
                anim3.path = self.path8.CGPath
                anim3.duration = 1.0
                anim3.rotationMode = kCAAnimationLinear
                anim3.repeatCount = 0
                self.newImage.center = CGPoint(x: 400, y: 920)
                self.newImage.layer.addAnimation(anim3, forKey: "animate position along path")
            })
        }
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        setupScene()
    }
    
    func setupScene(){
        backrgroundImage.frame.origin = CGPoint.zeroPoint
        backrgroundImage.frame.size = self.view.frame.size
        collectionButton.center = self.view.center
        newButton.center = self.view.center
        colectionImage.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 35)
        
        newImage.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 70)
    }
}

