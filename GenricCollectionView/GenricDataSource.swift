
//  GenricDataSource.swift
//  GenricCollectionView
//
//  Created by Bhavesh Chaudhari on 03/06/19.
//  Copyright © 2019 Bhavesh Chaudhari. All rights reserved.
//

import Foundation
import UIKit



protocol reuableCollectionCell {
    static var reuseIdentifier : String {get}
}

extension reuableCollectionCell {
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}


protocol ConfiGurable : reuableCollectionCell {
    associatedtype T
    func configure( iteam : T)
}


extension UICollectionView {
    func dequeueReusableCell<T: reuableCollectionCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        
        return cell
    }
}




 class CollectionGenricDataSource<T,Cell:UICollectionViewCell> : NSObject , UICollectionViewDataSource where Cell:ConfiGurable , T == Cell.T {
    
    var models : [[T]]!
    typealias  cellCallback = ((Cell,IndexPath) -> ())?
    var cellForRowCallback : cellCallback
    
    
    init(source:[[T]],cellForRow : cellCallback? = nil) {
        self.models = source
        self.cellForRowCallback = cellForRow ?? nil
        super.init()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell : Cell = collectionView.dequeueReusableCell(for: indexPath)
        let iteam = models[indexPath.section][indexPath.row]
        collectionCell.configure(iteam: iteam)
        if cellForRowCallback != nil {
            cellForRowCallback!(collectionCell,indexPath)
        }
        return collectionCell
    }
    
}


