//
//  PartituraServices.swift
//  C#
//
//  Created by Letícia Gonçalves on 7/8/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import Foundation

class PartituraServices {
    static func criarPartitura(autor:String, nome:String, qtdCompassos: NSNumber, ritmo: NSNumber, tempos: NSData, image: NSData, notas: NSOrderedSet){
        var partitura:Partitura = Partitura()
        partitura.autor = autor
        partitura.nome = nome
        partitura.qtdCompassos = qtdCompassos
        partitura.ritmo = ritmo
        partitura.tempos = tempos
        partitura.image = image
        partitura.notas = notas
    }
}