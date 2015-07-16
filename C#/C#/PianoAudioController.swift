//
//  PianoAudioController.swift
//  PianoTest
//
//  Created by Henrique de Abreu Amitay on 15/07/15.
//  Copyright (c) 2015 Henrique de Abreu Amitay. All rights reserved.
//

import Foundation

class PianoAudioController {
    
    static let sharedInstance = PianoAudioController()
    
    var audioController = AEAudioController(audioDescription: AEAudioController.nonInterleaved16BitStereoAudioDescription())
    
    
    func startEngine(){
    
    //Tratamento de Erro
    var error: NSErrorPointer = nil
        
    var result: Bool = audioController.start(error)
    
    if(!result)
    {
    NSLog("Erro inicializando a Audio Engine")
    }
 }
    
}