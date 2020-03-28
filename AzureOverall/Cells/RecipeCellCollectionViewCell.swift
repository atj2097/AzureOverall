//
//  RecipeCellCollectionViewCell.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import SnapKit
class RecipeCellCollectionViewCell: UICollectionViewCell {
    
    lazy var recipeImage: UIImageView = {
        let imageView = UIImageView()
         imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var recipeTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AzureConstants.azureFont , size: 20)
         label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var readyMinutes: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AzureConstants.azureFont , size: 20)
         label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var servings: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AzureConstants.azureFont , size: 20)
         label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
            addSubviews()
               constraints()
        setupContentView()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")

       }
    
    private func addSubviews() {
        contentView.addSubview(recipeImage)
        contentView.addSubview(recipeTitle)
        contentView.addSubview(servings)
        contentView.addSubview(readyMinutes)
        print(UIFont.familyNames.sorted())
    }
    
    private func constraints() {
        recipeImage.snp.makeConstraints{ make in
            make.width.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(1.7)
        }
        recipeTitle.snp.makeConstraints{ make in
            make.bottom.equalTo(recipeImage).offset(50)
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
        }
        
        servings.snp.makeConstraints{ make in
            make.top.equalTo(recipeTitle).offset(60)
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
        }
        
        readyMinutes.snp.makeConstraints{ make in
            
            make.top.equalTo(servings).offset(50)
            make.left.equalTo(contentView)
            make.width.equalTo(contentView)
            
        }
        
    }
    func setupContentView() {
        contentView.backgroundColor = AzureConstants.azureGreen
      contentView.layer.shadowColor = UIColor(red: 35/255, green: 46/255, blue: 33/255, alpha: 1).cgColor
      contentView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
      contentView.layer.shadowOpacity = 0.9
      recipeImage.layer.shadowRadius = 4
        recipeImage.layer.shadowColor = UIColor(red: 35/255, green: 46/255, blue: 33/255, alpha: 1).cgColor
        recipeImage.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        recipeImage.layer.shadowOpacity = 0.9
        recipeImage.layer.shadowRadius = 4
    }
    
}
