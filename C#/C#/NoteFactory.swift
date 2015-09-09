//
//  NoteFactory.swift
//  C#
//
//  Created by Henrique de Abreu Amitay on 30/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit


class NoteFactory : NSObject {
    
    var noteBeat : Float
    
    init(beat : Float) {
        self.noteBeat = beat
    }
    
    
    //Create note
    func createNote(duration : Float) -> Nota{
        var nota : Nota = Nota()
        return nota
    }
    
    //Calculate which symbol we should use
    func searchNoteSymbol(duration : Float) -> Int{
        
        //First we check the duration of the note
        var relativeDuration = duration / noteBeat
        
        //Caso breve
        if(relativeDuration >= 4){
            return 4
        }
        
        //Caso semibreve+1 nao implementado
        if(relativeDuration >= 3){
            return 3
        }
        
        //Caso semibreve
        if(relativeDuration >= 2){
            return 2
        }
        
        //Caso seminima
        if(relativeDuration >= 1){
            return 1
        }
        //Caso colcheia
            return 0
    }
    
}


