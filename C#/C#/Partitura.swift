//
//  Partitura.swift
//  C#
//
//  Created by Carlos Eduardo Millani on 07/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import Foundation
import CoreData

class Partitura: NSManagedObject {

    @NSManaged var tempos: NSData
    @NSManaged var ritmo: NSNumber
    @NSManaged var qtdCompassos: NSNumber
    @NSManaged var nome: String
    @NSManaged var autor: String
    @NSManaged var notas: NSOrderedSet

}
