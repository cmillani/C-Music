//
//  Nota.swift
//  C#
//
//  Created by Letícia Gonçalves on 7/8/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import Foundation
import CoreData

class Nota: NSManagedObject {

    @NSManaged var simbolo: NSNumber
    @NSManaged var som: NSNumber
    @NSManaged var tempo: NSNumber
    @NSManaged var partitura: Partitura

}
