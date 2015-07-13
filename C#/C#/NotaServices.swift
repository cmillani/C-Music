//
//  NotaServices.swift
//  C#
//
//  Created by Letícia Gonçalves on 7/8/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import Foundation

class NotaServices
{
    static func criarNota(simbolo:NSInteger, som: NSInteger, tempo: NSInteger)
    {
        var nota:Nota = Nota()
        nota.simbolo = simbolo
        nota.som = som
        nota.tempo = tempo
        // insert it
        NotaDAO.insert(nota)
    }
    
//    static func excluirNota(nota: Nota)
//    {
//        //create queue
//        var auxiliarQueue:NSOperationQueue = NSOperationQueue()
//        
//        //create operation
//        let deleteOperation : NSBlockOperation = NSBlockOperation(block: {
//            //find object
//            var
//        })
//    }
}