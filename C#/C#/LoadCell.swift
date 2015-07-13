//
//  LoadCell.swift
//  C#
//
//  Created by Carlos Eduardo Millani on 08/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit

class LoadCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var partiture:Partitura?
    
    func setupCell(partiture:Partitura)
    {
        self.partiture = partiture
        self.image.backgroundColor = UIColor(red: 52, green: 203, blue: 102, alpha: 50)
        self.image.image = UIImage(data: partiture.image)
        self.label.text = partiture.nome
    }
}
