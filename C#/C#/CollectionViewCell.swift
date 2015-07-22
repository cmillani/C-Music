//
//  CollectionViewCell.swift
//  scrollingSheet
//
//  Created by Letícia Gonçalves on 7/16/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    var noteName : String!
    var note : Nota?
    var notes : [Nota]?
    //Posicoes:
    
    func setupCell(simbolo: NSNumber){
        noteName = numberToString(simbolo)
        self.setupCellwithString(noteName)
        
    }
    
    func setupCellwithString(simbolo: String){
        var novanota = UIImage(named: simbolo)
        self.image.addSubview(UIImageView(image: novanota))
        self.image.image=UIImage(named: "pauta")
//        self.image.
    }
    
    func numberToString(simbolo: NSNumber) -> String {
        var name : String
        switch simbolo
        {
            case 0:
                name = "C2"
            case 1:
                name = "C2#"
            case 2:
                name = "D2"
            case 3:
                name = "D2#"
            case 4:
                name = "E2"
            case 5:
                name = "F2"
            case 6:
                name = "F2#"
            case 7:
                name = "G2"
            case 8:
                name = "G2#"
            case 9:
                name = "A2"
            case 10:
                name = "B2"
            case 11:
                name = "B2#"
            case 12:
                name = "clave_sol"
            case 13:
                name = "colcheia"
            case 14:
                name = "semiminima"
            case 15:
                name = "breve"
            default:
                name = "Not found"
        }
        return name
    }
    
}
