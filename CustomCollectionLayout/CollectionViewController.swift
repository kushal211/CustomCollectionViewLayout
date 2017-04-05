//
//  CollectionViewController.swift
//  CustomCollectionLayout
//
//  Created by JOSE MARTINEZ on 15/12/2014.
//  Copyright (c) 2014 brightec. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // These two strings are the Identifiers set in the Storyboard
    // for the DateCollectionViewCell and ContentCollectionViewCell
    let dateCellIdentifier = "DateCellIdentifier"
    let contentCellIdentifier = "ContentCellIdentifier"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    // MARK - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 50
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            // first row
            return 4
        } else {
            return 7
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // This is the first row
        if (indexPath as NSIndexPath).section == 0 {
            if (indexPath as NSIndexPath).row == 0 {
                // This is the first cell of the first row. Label it.
                let dateCell : DateCollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: dateCellIdentifier, for: indexPath) as! DateCollectionViewCell
                dateCell.backgroundColor = UIColor.white
                dateCell.dateLabel.font = UIFont.systemFont(ofSize: 13)
                dateCell.dateLabel.textColor = UIColor.black
                dateCell.dateLabel.text = "Date"
                
                return dateCell
            } else {
                // This is the rest of the first row.
                let contentCell : ContentCollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: contentCellIdentifier, for: indexPath) as! ContentCollectionViewCell
                contentCell.contentLabel.font = UIFont.systemFont(ofSize: 13)
                contentCell.contentLabel.textColor = UIColor.black
                contentCell.contentLabel.text = "Section"
                
                if (indexPath as NSIndexPath).section % 2 != 0 {
                    contentCell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
                } else {
                    contentCell.backgroundColor = UIColor.white
                }
                
                return contentCell
            }
        } else {
            // These are the remaining rows
            if (indexPath as NSIndexPath).row == 0 {
                // This is the first column of each row. Label it accordingly.
                let dateCell : DateCollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: dateCellIdentifier, for: indexPath) as! DateCollectionViewCell
                dateCell.dateLabel.font = UIFont.systemFont(ofSize: 13)
                dateCell.dateLabel.textColor = UIColor.black
                dateCell.dateLabel.text = String((indexPath as NSIndexPath).section)
                if (indexPath as NSIndexPath).section % 2 != 0 {
                    dateCell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
                } else {
                    dateCell.backgroundColor = UIColor.white
                }
                
                return dateCell
            } else {
                // These are all the remaining content cells (neither first column nor first row)
                let contentCell : ContentCollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: contentCellIdentifier, for: indexPath) as! ContentCollectionViewCell
                contentCell.contentLabel.font = UIFont.systemFont(ofSize: 13)
                contentCell.contentLabel.textColor = UIColor.black
                contentCell.contentLabel.text = "Content"
                if (indexPath as NSIndexPath).section % 2 != 0 {
                    contentCell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
                } else {
                    contentCell.backgroundColor = UIColor.white
                }
                
                return contentCell
            }
        }
    }
}
