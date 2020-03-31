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
    var cart = [RecipeResult]()

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
    
    lazy var amountOfTimes: UITextField = {
      let input = UITextField()
        input.placeholder = "Enter Amount"
        return input
    }()
    
    lazy var currentCartContains: UILabel = {
        let label = UILabel()
        UIUtilities.setUILabel(label, labelTitle: "", size: 14, alignment: .center)
        return label
    }()
    
    lazy var addToCartButton: AddToCart = {
        let button = AddToCart()
        button.setUpCartButton(button: button, target: self, action: #selector(handleStepper), width: 50, height: 30)
        return button
    }()
    
    lazy var uiStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.maximumValue = 10
        stepper.minimumValue = 0
        stepper.tintColor = AzureConstants.azureGreen
        stepper.addTarget(self, action: #selector(handleStepper), for: .touchUpInside)
        return stepper
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
        addSubview(uiStepper)
        addSubview(readyIn)
        addSubview(servings)
        addSubview(currentCartContains)
        addSubview(addToCartButton)
        constraints()
    }
    
    @objc func handleStepper() {
        currentCartContains.text = "\(Int(uiStepper.value)) Servings"
    }
    
    @objc func addToCart() {
        currentRecipe.amountInCart = Int(uiStepper.value)
        try? CartPersistenceManager.manager.saveRecipe(recipe: currentRecipe)
    }
    
    
    private func constraints() {
        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
            
        recipeTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        
        
        
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
        
        uiStepper.translatesAutoresizingMaskIntoConstraints = false
        uiStepper.topAnchor.constraint(equalTo: recipeImage.bottomAnchor).isActive = true
        uiStepper.centerXAnchor.constraint(equalTo: recipeImage.centerXAnchor).isActive = true
        
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        addToCartButton.topAnchor.constraint(equalTo: uiStepper.bottomAnchor).isActive = true
        addToCartButton.leftAnchor.constraint(equalTo: uiStepper.leftAnchor).isActive = true
        addToCartButton.centerXAnchor.constraint(equalTo: uiStepper.centerXAnchor).isActive = true
        addToCartButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
//        amountOfTimes.snp.makeConstraints{ make in
//            make.top.equalTo(550)
//            make.centerX.equalTo(self)
//            make.width.equalTo(recipeImage)
//            make.height.equalTo(50)
//        }
        
        currentCartContains.translatesAutoresizingMaskIntoConstraints = false
        currentCartContains.topAnchor.constraint(equalTo: addToCartButton.bottomAnchor).isActive = true
        currentCartContains.leftAnchor.constraint(equalTo: addToCartButton.leftAnchor).isActive = true
        currentCartContains.widthAnchor.constraint(equalTo: addToCartButton.widthAnchor).isActive = true
    }

}
