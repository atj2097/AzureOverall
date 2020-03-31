//
//  DetailViewController.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import Kingfisher
//MARK: Add Cart Information - Take the current number of items in a cart, A stepper that adds and removes an item to the cart
class DetailViewController: UIViewController {
    let detailView = DetailView()
    var currentRecipe: RecipeResult!
    var cart = [RecipeResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.currentRecipe = currentRecipe
//        cart = loadCart()
//        var currentAmountOfTimesItemIsInCart = cart.filter({$0.id == currentRecipe.id}).count
//        detailView.currentCartContains.text = "This item is in the cart \(currentAmountOfTimesItemIsInCart) times"
        setUpData()
    }
    private func loadCart() -> [RecipeResult] {
        cart = try! CartPersistenceManager.manager.getCart()
        return cart
    }
    
    func setUpData() {
        detailView.recipeTitle.text = currentRecipe.title
        let url = URL(string: AzureConstants.baseImageURL + currentRecipe.imageUrls[0])
        detailView.recipeImage.kf.setImage(with: url)
        detailView.servings.text = "Servings: \( currentRecipe.servings)"
        detailView.readyIn.text = "Ready In: \(currentRecipe.readyInMinutes) Minutes"
    }
   

}
