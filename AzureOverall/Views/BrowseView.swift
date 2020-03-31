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
    
    lazy var pursuitFarms: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AzureConstants.azureFont , size: 40)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = AzureConstants.azureGreen
        label.text = "Pursuit Farms"
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
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
        searchBarConstraints()
        collectionViewConstraints()
        backgroundColor = .white
    }
    
    private func searchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 105),
            searchBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: frame.height / 10)
        ])
    }
    
    private func collectionViewConstraints() {
        //Collection View
        let viewWidth = self.bounds.width / 1
        let height = self.bounds.height / 1.5
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
