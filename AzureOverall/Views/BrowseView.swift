//
//  BrowseView.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import SnapKit
import AnimatedCollectionViewLayout

class BrowseView: UIView {
    
    var animator: (LayoutAttributesAnimator, Bool, Int, Int)?
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Recipe"
        return searchBar
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView(frame:.zero , collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 400, height: 500)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        collectionView.backgroundColor = AzureConstants.azureWhite
collectionView.register(RecipeCellCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.recipeCell.rawValue)
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
        addSubview(collectionView)
        addSubview(searchBar)
        constraints()
        backgroundColor = .white
        
    }
    
    private func constraints() {
        searchBar.snp.makeConstraints{ make in
            make.top.equalTo(self).offset(40)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            
        }
        collectionView.snp.makeConstraints{ make in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.top.equalTo(searchBar).offset(5)
        }
    }

}
