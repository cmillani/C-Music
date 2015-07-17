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
    func setupCell(note: String){
        
        self.image.image=UIImage(named: note)

        /*
        if(note != "clave_sol" ){
            
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.image.frame.width/2, height: self.image.frame.height/2)

        }*/
        
        
    }
}
