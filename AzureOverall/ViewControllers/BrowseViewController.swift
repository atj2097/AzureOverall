//
//  BrowseViewController.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import Alamofire


class BrowseViewController: UIViewController {
    let browseView = BrowseView()
    var recipes = [RecipeResult]()
    var searchWord: String = "apple"
    var requestSize: Int = 6

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(browseView)
//        let cardSlider = CardSliderViewController.with(dataSource: self)
//        cardSlider.title = "Movies"
//        cardSlider.modalPresentationStyle = .fullScreen
//        present(cardSlider, animated: true, completion: nil)
    }
    
   private func fetchData() {
        let request = AF.request("\(AzureConstants.apiURL)?query=\(searchWord)&number=\(requestSize)&apiKey=\(SecretAPIKey.recipeAPIKey)")
          request.responseDecodable(of: Recipe.self) { (response) in
            guard let data = response.value else { return }
            self.recipes = data.results
          }
        }
}
