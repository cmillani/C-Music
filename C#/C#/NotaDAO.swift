//
//  NotaDAO.swift
//  C#
//
//  Created by Letícia Gonçalves on 7/8/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import Foundation
import CoreData

class NotaDAO {
    
    static func insert(objectToBeInserted:Nota)
    {
        // insert element into context
        DatabaseManager.sharedInstance.managedObjectContext?.insertObject(objectToBeInserted)
        
        // save context
        var error:NSErrorPointer = nil
        DatabaseManager.sharedInstance.managedObjectContext?.save(error)
        if (error != nil)
        {
            // log error
            print(error)
        }
        
        
    }
    
    static func delete(objectToBeDeleted:Nota)
    {
        // remove object from context
        var error:NSErrorPointer = nil
        DatabaseManager.sharedInstance.managedObjectContext?.deleteObject(objectToBeDeleted)
        DatabaseManager.sharedInstance.managedObjectContext?.save(error)
        
        // log error
        if (error != nil)
        {
            // log error
            print(error)
        }
    }
}
