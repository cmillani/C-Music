//
//  PartituraDAO.swift
//  C#
//
//  Created by Letícia Gonçalves on 7/8/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import Foundation
import CoreData

class PartituraDAO {
    static func findAll() -> [Partitura]?
    {
        //creating fetch request
        let request = NSFetchRequest(entityName: "Partitura")
        
        // perform search
        var error:NSErrorPointer = nil
        let results:[Partitura] = DatabaseManager.sharedInstance.managedObjectContext?.executeFetchRequest(request, error: error) as! [Partitura]
        
        return results
    }
    
    static func insert(objectToBeInserted:Partitura)
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

    static func delete(objectToBeDeleted:Partitura)
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
