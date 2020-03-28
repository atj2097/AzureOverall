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
    }
    
    private func constraints() {
        recipeImage.snp.makeConstraints{ make in
            make.width.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(1.5)
        }
    }
    func setupContentView() {
        contentView.backgroundColor = AzureConstants.azureGreen
      contentView.layer.shadowColor = UIColor(red: 35/255, green: 46/255, blue: 33/255, alpha: 1).cgColor
      contentView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
      contentView.layer.shadowOpacity = 0.9
      contentView.layer.shadowRadius = 4
    }
    
}
