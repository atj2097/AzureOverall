//
//  DetailView.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit

class DetailView: UIView {
    var currentRecipe: RecipeResult!
    lazy var recipeImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var recipeTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AzureConstants.azureFont , size: 40)
         label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = AzureConstants.azureGreen
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var servings: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AzureConstants.azureFont , size: 20)
         label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = AzureConstants.azureGreen
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var readyIn: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AzureConstants.azureFont , size: 20)
         label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = AzureConstants.azureGreen
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var addToCartButton: AddToCart = {
        let button = AddToCart()
        button.setUpCartButton(button: button, target: self, action: #selector(addToCart), width: 50, height: 30)
        return button
    }()

    override init(frame: CGRect) {
           super.init(frame: UIScreen.main.bounds)
           commonInit()
        backgroundColor = .white

       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       
       }
    private func commonInit() {
        addSubview(recipeImage)
        addSubview(recipeTitle)
        addSubview(addToCartButton)
        addSubview(readyIn)
        addSubview(servings)
        constraints()
    }
    
    @objc func addToCart() {
        try? CartPersistenceManager.manager.saveRecipe(recipe: currentRecipe)
        

    }
    
    private func constraints() {
        recipeTitle.snp.makeConstraints{ make in
            make.top.equalTo(self).offset(50)
            make.left.equalTo(self).offset(20)
            make.width.equalTo(self)
            
        }
        servings.snp.makeConstraints{ make in
            make.bottom.equalTo(recipeTitle).offset(40)
            make.left.equalTo(recipeTitle)
            make.width.equalTo(recipeTitle)
        }
        readyIn.snp.makeConstraints{ make in
    make.bottom.equalTo(servings).offset(40)
            make.left.equalTo(servings)
            make.width.equalTo(servings)
            
        }
        recipeImage.snp.makeConstraints{ make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(300)
            make.height.equalTo(250)
        }
        
        addToCartButton.snp.makeConstraints{ make in
            make.top.equalTo(550)
            make.centerX.equalTo(self)
            make.width.equalTo(recipeImage)
            make.height.equalTo(50)
        }
        
        
        
        
    }

}
