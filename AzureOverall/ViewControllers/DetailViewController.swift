//
//  DetailViewController.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    let detailView = DetailView()
    var currentRecipe: RecipeResult!
    var cart = [RecipeResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.currentRecipe = currentRecipe
        detailView.amountOfItemsStepper.value = Double(currentRecipe.amountInCart ?? 0)
        checkIfItemIsInCart()
        setUpData()
    }
    
    private func checkIfItemIsInCart () {
        cart = loadCart()
        if cart.contains(currentRecipe){
            cart = cart.filter({$0.id == currentRecipe.id})
            currentRecipe.amountInCart = cart[0].amountInCart
            detailView.currentCartContains.text = "\(currentRecipe.amountInCart ?? 1)"
        }
    }
    private func loadCart() -> [RecipeResult] {
        return try! CartPersistenceManager.manager.getCart()
        
    }
    
    func setUpData() {
        detailView.recipeTitle.text = currentRecipe.title
        let url = URL(string: AzureConstants.baseImageURL + currentRecipe.imageUrls[0])
        detailView.recipeImage.kf.setImage(with: url)
        detailView.servings.text = "Servings: \( currentRecipe.servings)"
        detailView.readyIn.text = "Ready In: \(currentRecipe.readyInMinutes) Minutes"
    }
   

}
