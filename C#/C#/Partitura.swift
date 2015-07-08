//
//  Partitura.swift
//  C#
//
//  Created by Letícia Gonçalves on 7/8/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import Foundation
import CoreData

class Partitura: NSManagedObject {

    @NSManaged var autor: String
    @NSManaged var nome: String
    @NSManaged var qtdCompassos: NSNumber
    @NSManaged var ritmo: NSNumber
    @NSManaged var tempos: NSData
    @NSManaged var image: NSData
    @NSManaged var notas: NSOrderedSet

}
