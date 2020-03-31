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
        setUpData()
    }
    
    private func checkIfItemIsInCart () {
        if currentRecipe.amountInCart ?? 0 > 0 {
            detailView.currentCartContains.text = "\(currentRecipe.amountInCart ?? 0)"
        }
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
