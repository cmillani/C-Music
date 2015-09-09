//
//  Drawer.swift
//  C#
//
//  Created by Henrique de Abreu Amitay on 30/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit


//This class is used to draw a compass for the view controller

class Drawer: NSObject {
    
    //Singleton
    static let sharedInstance = Drawer()
    
    //Draw a Compass, to the Record View
    func drawCompass(onPosition: CGPoint) -> UIView {
        
        //Sheet image and size
        var backgroundImage = UIImageView(image: UIImage(named: "Compass"))
        var compassSize = backgroundImage.image?.size
        
        
        var compass : UIView = UIView(frame: CGRect(origin: onPosition, size: compassSize!))
        
        //We add the background, now we need to add the notes
        compass.addSubview(backgroundImage)
       
        
        //Add notes
        
        
        //If needed we scale the view
        compass.transform = CGAffineTransformMakeTranslation(1, 1)
        
        
        return compass
    }

       
}
