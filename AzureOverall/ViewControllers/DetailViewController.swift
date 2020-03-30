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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        setUpData()
        self.navigationItem.title = ""
        
         // Do any additional setup after loading the view.
    }
    
    func setUpData() {
        detailView.recipeTitle.text = currentRecipe.title
        let url = URL(string: AzureConstants.baseImageURL + currentRecipe.imageUrls[0])
        detailView.recipeImage.kf.setImage(with: url)
        detailView.servings.text = "Servings: \( currentRecipe.servings)"
        detailView.readyIn.text = "Ready In: \(currentRecipe.readyInMinutes) Minutes"
    }
   

}
