//
//  Piano.swift
//  PianoTest
//
//  Created by Henrique de Abreu Amitay on 15/07/15.
//  Copyright (c) 2015 Henrique de Abreu Amitay. All rights reserved.
//

import UIKit

class Piano: NSObject {
    
    //Faremos o piano um singleton
    static let sharedInstance = Piano()
    
    //Nomes das notas, usados na inicializacao do piano
    let notes = ["C2", "C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A#2","B2"]
    
    //Array de audio, tambem usado na inicializacao
    var noteArray : [AEAudioFilePlayer] = []
    
    //Notas sendo tocadas atualmente, usado para montagem da partitura
    var currentNotes : [AEAudioFilePlayer] = []
    
    
    override init (){

        //Error
        var error: NSError?
        
        //Init noteArray
        for noteName in notes
        {
            //Abrimos os arquivos de som do mainBundle
            var fileName = NSBundle.mainBundle().URLForResource(noteName, withExtension: "aif")
            
            //Criamos um AEAudioFilePlayer deste arquivo
            var audio = AEAudioFilePlayer.audioFilePlayerWithURL(fileName, audioController: PianoAudioController.sharedInstance.audioController, error: &error) as! AEAudioFilePlayer
            
            if error != nil {
                println("Error \(error!.localizedDescription)")
            }
            
            //Alteramos o volume e o currentTime para melhorar a qualidade do som
            audio.volume = 0.3
            audio.currentTime = NSTimeInterval(0.3)
            
            //Colocamos o som no nosso array de notas
            self.noteArray.append(audio)
        }
        
        
    }
    

    func playNote (noteName : Int)
    {
   
        //Dada uma nota, toca-a
        PianoAudioController.sharedInstance.audioController.addChannels([noteArray[noteName]])
        self.noteArray[noteName].channelIsPlaying = true
        
        //Acrescenta o audio no array
        self.currentNotes.append(noteArray[noteName])
        
    }
    
    func stopPlayingNote (noteName : Int)
    {
        //Para de tocar uma nota especifica
        
        var counter = 0
        
        //Percorremos o array de notas sendo tocadas atualmente
        for note in self.currentNotes
        {
            //Caso a achemos, paramos de toca-la e a retiramos do nosso array, tambem podemos sair do loop
            if (note.isEqual(noteArray[noteName]))
            {
                self.currentNotes.removeAtIndex(counter)
                note.channelIsPlaying = false
                note.currentTime = NSTimeInterval(0.3)
                PianoAudioController.sharedInstance.audioController.removeChannels([note])
                break
            }
            counter++;
        }
    }
    
    
    func stopPlayingAllNotes()
    {
        //Para de tocar todas as notas
        for note in self.currentNotes
        {
            note.channelIsPlaying = false
            note.currentTime = NSTimeInterval(0.3)
            PianoAudioController.sharedInstance.audioController.removeChannels([note])
            self.currentNotes.removeAll(keepCapacity: false)
        }
    }
    
    
}

