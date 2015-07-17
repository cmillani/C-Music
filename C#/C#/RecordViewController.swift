//
//  RecordViewController.swift
//  C#
//
//  Created by Henrique de Abreu Amitay on 16/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit


class RecordViewController: UIViewController, UICollectionViewDataSource{
    
    //CollectionViewController
    @IBOutlet weak var collectionManager: UICollectionView!

    //TableData
    var tableData: [String]? = ["clave_sol","colcheia"]


    //Piano keys
    @IBOutlet weak var C2key: PianoKey?
    @IBOutlet weak var C2akey: PianoKey?
    @IBOutlet weak var D2key: PianoKey?
    @IBOutlet weak var D2akey: PianoKey?
    @IBOutlet weak var E2key: PianoKey?
    @IBOutlet weak var F2key: PianoKey?
    @IBOutlet weak var F2akey: PianoKey?
    @IBOutlet weak var G2key: PianoKey?
    @IBOutlet weak var A2key: PianoKey?
    @IBOutlet weak var A2akey: PianoKey?
    @IBOutlet weak var B2key: PianoKey?
    @IBOutlet weak var G2akey: PianoKey?
    
    //Note count
    var noteCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteCount = 0
        self.collectionManager.dataSource = self
        self.collectionManager.backgroundColor = UIColor(patternImage: UIImage(named: "sheet")!)
        //Start the engine and the Piano
        PianoAudioController.sharedInstance.startEngine()
        setKeys()
        
    }
    
    func setKeys()
    {
        //Set the keys sounds
        self.C2key!.setKeyNote(0)
        self.C2akey!.setKeyNote(1)
        self.D2key!.setKeyNote(2)
        self.D2akey!.setKeyNote(3)
        self.E2key!.setKeyNote(4)
        self.F2key!.setKeyNote(5)
        self.F2akey!.setKeyNote(6)
        self.G2key!.setKeyNote(7)
        self.G2akey!.setKeyNote(8)
        self.A2key!.setKeyNote(9)
        self.A2akey!.setKeyNote(10)
        self.B2key!.setKeyNote(11)
        
        //Set the views
        C2key?.outerView = self
        C2akey?.outerView = self
        D2key?.outerView = self
        D2akey?.outerView = self
        E2key?.outerView = self
        F2key?.outerView = self
        F2akey?.outerView = self
        G2key?.outerView = self
        G2akey?.outerView = self
        A2key?.outerView = self
        A2akey?.outerView = self
        B2key?.outerView = self

    }
    
    func addNote()
    {
        
        tableData?.append("nota")
        self.collectionManager.reloadData()
        
        // var count = tableData?.count
                //var indexPath = NSIndexPath(index: 1)
        //NSLog("\(indexPath.length)")
        //self.collectionManager.reloadItemsAtIndexPaths([indexPath])
        //self.noteCount++
        //self.collectionManager.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let qtty = tableData?.count
        {
            return qtty
        }
        else
        {
            return 0
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.setupCell(self.tableData![indexPath.item])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(indexPath.row) selected")
    }
    
    
    
}
