//
//  LoadViewController.swift
//  C#
//
//  Created by Carlos Eduardo Millani on 08/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit

class LoadViewController: UICollectionViewController {
    var savedPartitures:[Partitura]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.savedPartitures = PartituraDAO.findAll()
    }
}

extension LoadViewController : UICollectionViewDataSource
{
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let qtty = self.savedPartitures?.count
        {
            return qtty
        }
        else
        {
            return 0
        }
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("defaultCell", forIndexPath: indexPath) as! LoadCell
        if let obj = self.savedPartitures?[indexPath.item]
        {
            cell.setupCell(obj)
        }
        return cell
    }
}

extension LoadViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = CGSize(width: 200, height: 240)
        return size
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
        return insets
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("Clicou %@", indexPath)
    }
}

