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
       imageView.layer.shadowRadius = 4
       imageView.layer.shadowColor = UIColor(red: 35/255, green: 46/255, blue: 33/255, alpha: 1).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        imageView.layer.shadowOpacity = 0.9
        imageView.layer.shadowRadius = 4
        imageView.contentMode = .scaleAspectFit
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
        UIUtilities.setUILabel(label, labelTitle: "", size: 40, alignment: .center)
        label.textColor = AzureConstants.azureGreen
        return label
    }()
    
    lazy var addToCartButton: AddToCart = {
        let button = AddToCart()
        button.setUpCartButton(button: button, target: self, action: #selector(addToCart), width: 100, height: 30)
        return button
    }()
    
    lazy var amountOfItemsStepper: UIStepper = {
        let stepper = UIStepper(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        stepper.backgroundColor = .clear
        stepper.setIncrementImage(#imageLiteral(resourceName: "icons8-chevron-right-50"), for: .normal)
        stepper.setDecrementImage(#imageLiteral(resourceName: "icons8-chevron-left-50"), for: .normal)
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
        currentCartContains.text = "0"

       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       
       }
    private func commonInit() {
        addSubview(recipeImage)
        addSubview(recipeTitle)
        addSubview(amountOfItemsStepper)
//        addSubview(readyIn)
//        addSubview(servings)
        addSubview(currentCartContains)
        addSubview(addToCartButton)
        constraints()
    }
    
    @objc func handleStepper() {
        currentCartContains.text = "\(Int(amountOfItemsStepper.value))"
    }
    
    @objc func addToCart() {
        currentRecipe.amountInCart = Int(amountOfItemsStepper.value)
        if currentRecipe.amountInCart == 0 {
            currentRecipe.amountInCart! += 1
        }
        try? CartPersistenceManager.manager.saveRecipe(recipe: currentRecipe)
        currentCartContains.text = "Saved To Cart!"
    }
    
    
    private func constraints() {
        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
            
        recipeTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        recipeTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10 ).isActive = true
        
        recipeTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        recipeTitle.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        recipeImage.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: 10).isActive = true
        recipeImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        recipeImage.heightAnchor.constraint(equalToConstant: self.frame.height / 2.3 ).isActive = true
        
        amountOfItemsStepper.translatesAutoresizingMaskIntoConstraints = false
        amountOfItemsStepper.topAnchor.constraint(equalTo: currentCartContains.bottomAnchor, constant: 10).isActive = true
        amountOfItemsStepper.centerXAnchor.constraint(equalTo: recipeImage.centerXAnchor).isActive = true
        
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
            
        addToCartButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addToCartButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        
        addToCartButton.widthAnchor.constraint(equalToConstant: self.bounds.width / 1.5).isActive = true
        
        addToCartButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            

        
        currentCartContains.translatesAutoresizingMaskIntoConstraints = false
        currentCartContains.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10 ).isActive = true
        currentCartContains.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

}
