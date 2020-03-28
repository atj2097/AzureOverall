//
//  BrowseView.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import SnapKit

class BrowseView: UIView {
    
    lazy var collectionView: UICollectionView = {
      let collectionView = UICollectionView()
        
    return collectionView
    }()
    override init(frame: CGRect) {
           super.init(frame: UIScreen.main.bounds)
           commonInit()

       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       
       }
    private func commonInit() {
        
    }

}
