//
//  pianoKey.swift
//  PianoTest
//
//  Created by Henrique de Abreu Amitay on 16/07/15.
//  Copyright (c) 2015 Henrique de Abreu Amitay. All rights reserved.
//

import UIKit

class PianoKey: UIImageView{

    var note : Int = 0
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("Aqui")
        Piano.sharedInstance.playNote(note)
        self.highlighted = true
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        Piano.sharedInstance.stopPlayingNote(note)
        self.highlighted = false
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch: UITouch = touches.first as! UITouch
        
        var location : CGPoint = touch.locationInView(self)
        var prevLocation : CGPoint = touch.previousLocationInView(self)
        
    }
    

    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        
    }
    
    func setKeyNote(note : Int)
    {
        self.note = note
    }
    
    
}