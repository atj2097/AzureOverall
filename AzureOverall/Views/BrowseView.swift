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
    
    lazy var cartView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0,width: 75, height: 75))
        view.backgroundColor = AzureConstants.azureGreen
        view.layer.cornerRadius = frame.height / 2
        view.layer.shadowColor = UIColor(red: 35/255, green: 46/255, blue: 33/255, alpha: 1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    private func commonInit() {
        addSubview(cartView)
        addSubview(collectionView)
        addSubview(searchBar)
        constraints()
        backgroundColor = .white
        
    }
    
    private func constraints() {
        
        cartView.snp.makeConstraints{ make in
            make.bottom.equalTo(self).offset(50)
            make.centerX.equalTo(self)
        }
        
        searchBar.snp.makeConstraints{ make in
            make.top.equalTo(self).offset(80)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
        }
        
        //Collection View
        var viewWidth = self.bounds.width / 1
        var height = self.bounds.height / 1.5
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
}
