//
//  Piano.swift
//  PianoTest
//
//  Created by Henrique de Abreu Amitay on 15/07/15.
//  Copyright (c) 2015 Henrique de Abreu Amitay. All rights reserved.
//

import UIKit

class Piano: NSObject {
    
    static let sharedInstance = Piano()
    
    //Notes names, used on initalizations
    let notes = ["C2", "C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A#2","B2"]
    
    //Audio Array
    var noteArray : [AEAudioFilePlayer] = []
    
    //Notes Currently being Playerd
    var currentNotes : [AEAudioFilePlayer] = []
    
    
    override init (){

        //Error
        var error: NSError?
        
        //Init noteArray
        for noteName in notes
        {
            var fileName = NSBundle.mainBundle().URLForResource(noteName, withExtension: "aif")
            
            var audio = AEAudioFilePlayer.audioFilePlayerWithURL(fileName, audioController: PianoAudioController.sharedInstance.audioController, error: &error) as! AEAudioFilePlayer
            
            if error != nil {
                println("Error \(error!.localizedDescription)")
            }
            audio.volume = 0.3
            audio.currentTime = NSTimeInterval(0.3)
            
            self.noteArray.append(audio)
        }
        
        
    }
    

    func playNote (noteName : Int)
    {
        //Since this function wont be called by the user, we can enum our notes
        //["C2", "C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A#2","B2"]
        
        PianoAudioController.sharedInstance.audioController.addChannels([noteArray[noteName]])
            self.currentNotes.append(noteArray[noteName])
            self.noteArray[noteName].channelIsPlaying = true
   
    }
    
    func stopPlayingNote (noteName : Int)
    {
        var counter = 0
        
        for note in self.currentNotes
        {
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
        for note in self.currentNotes
        {
            note.channelIsPlaying = false
            note.currentTime = NSTimeInterval(0.3)
            PianoAudioController.sharedInstance.audioController.removeChannels([note])
            self.currentNotes.removeAll(keepCapacity: false)
        }
    }
    
    
    
    
}

