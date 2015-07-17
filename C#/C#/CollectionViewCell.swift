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
    
    func setupCell(note: String){
        
        self.image.image=UIImage(named: note)
        self.noteName = note        
        
    }
}
