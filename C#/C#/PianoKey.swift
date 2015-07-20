//
//  pianoKey.swift
//  PianoTest
//
//  Created by Henrique de Abreu Amitay on 16/07/15.
//  Copyright (c) 2015 Henrique de Abreu Amitay. All rights reserved.
//

import UIKit

class PianoKey: UIImageView{

    //Som que a nota toca, por default ela é nula (C2)
    var note : Int = 0
    
    //Tempo que a nota foi tocada, usada para definir qual simbolo sera usado na partitura
    var timeTouched : Float = 0
    
    //Timer para contar o tempo
    var timer : NSTimer!
    
    
    //View que esta contida
    var outerView : RecordViewController!
    
    //Incrementa o tempo em 0.1 segundos
    func updateTime()
    {
        timeTouched += 0.1
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //Adiciona nota à partitura
        //Comeca a tocar o som da nota
        Piano.sharedInstance.playNote(note)
        
        //Highlight da imagem, para dar feedback ao usuario
        self.highlighted = true
        
        //Inicializa o timer
        let updateSelector : Selector = "updateTime"
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: updateSelector ,userInfo: nil, repeats: true)
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        //Para de tocar a nota
        Piano.sharedInstance.stopPlayingNote(note)
        
        //Desliga Highlight
        self.highlighted = false
        
        //Atualiza o array
        self.outerView.addNote(note, duracao: timeTouched)
        
        //Reseta o timer
        self.timer.invalidate()
        timeTouched = 0
    }
    
    func setKeyNote(note : Int)
    {
        //Seta a nota que deve ser tocada
        self.note = note
    }
    
}