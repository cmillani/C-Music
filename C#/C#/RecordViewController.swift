//
//  RecordViewController.swift
//  C#
//
//  Created by Henrique de Abreu Amitay on 16/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController{
    
    @IBOutlet weak var C2key: PianoKey?
    @IBOutlet weak var C2akey: PianoKey?
    @IBOutlet weak var D2key: PianoKey?
    @IBOutlet weak var D2akey: PianoKey?
    @IBOutlet weak var E2key: PianoKey?
    @IBOutlet weak var F2key: PianoKey?
    @IBOutlet weak var F2akey: PianoKey?
    @IBOutlet weak var G2key: PianoKey?
    @IBOutlet weak var A2key: PianoKey?
    @IBOutlet weak var A2akey: PianoKey?
    @IBOutlet weak var B2key: PianoKey?
    @IBOutlet weak var G2akey: PianoKey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Start the engine
        PianoAudioController.sharedInstance.startEngine()
        setKeys()
        
    }
    
    func setKeys()
    {
        self.C2key!.setKeyNote(0)
        self.C2akey!.setKeyNote(1)
        self.D2key!.setKeyNote(2)
        self.D2akey!.setKeyNote(3)
        self.E2key!.setKeyNote(4)
        self.F2key!.setKeyNote(5)
        self.F2akey!.setKeyNote(6)
        self.G2key!.setKeyNote(7)
        self.G2akey!.setKeyNote(8)
        self.A2key!.setKeyNote(9)
        self.A2akey!.setKeyNote(10)
        self.B2key!.setKeyNote(11)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    
    
}
