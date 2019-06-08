//
//  ViewController.swift
//  GenricCollectionView
//
//  Created by Bhavesh Chaudhari on 03/06/19.
//  Copyright © 2019 Bhavesh Chaudhari. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView : UICollectionView!
    
    @IBOutlet var headerLabel : UILabel!
    var dataSource : CollectionGenricDataSource<String,CollectionCell>! {
        didSet {
            self.collectionView.dataSource = dataSource
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = CollectionGenricDataSource<String,CollectionCell>(source: [["String11","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String12","String13"],["String21","String22","String23"]]) { (cell, indexpath)  in
                self.headerLabel.text = cell.labelText.text!
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.bounds.width, height: 120)
    }
}



class CollectionCell : UICollectionViewCell,ConfiGurable {
    
    @IBOutlet var labelText : UILabel!
    
    func configure(iteam: String) {
        labelText.text = iteam
    }
}















