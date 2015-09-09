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
        self.image.image=UIImage(named: "pauta")
        self.addSubview(UIImageView(image: novanota))
    }
    
    func positionInCelWithNumber(nota: NSNumber) -> CGPoint
    { //8
        let shift : CGFloat = 10
        var point : CGPoint = CGPoint(x: 0, y: -(8 * shift))
        switch nota
        {
        case 0:
            point = CGPoint(x: point.x, y: point.y + shift)
        case 1:
            point = CGPoint(x: point.x, y: point.y + 2 * shift)
        case 2:
            point = CGPoint(x: point.x, y: point.y + 3 * shift)
        case 3:
            point = CGPoint(x: point.x, y: point.y + 4 * shift)
        case 4:
            point = CGPoint(x: point.x, y: point.y + 5 * shift)
        case 5:
            point = CGPoint(x: point.x, y: point.y + 6 * shift)
        case 6:
            point = CGPoint(x: point.x, y: point.y + 7 * shift)
        case 7:
            point = CGPoint(x: point.x, y: point.y + 8 * shift)
        case 8:
            point = CGPoint(x: point.x, y: point.y + 9 * shift)
        case 9:
            point = CGPoint(x: point.x, y: point.y + 10 * shift)
        case 10:
            point = CGPoint(x: point.x, y: point.y + 11 * shift)
        case 11:
            point = CGPoint(x: point.x, y: point.y + 12 * shift)
        default:
            point = CGPoint(x: 0, y: 0)
        }
        return point
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
