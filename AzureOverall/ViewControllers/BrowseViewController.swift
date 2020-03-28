//
//  BrowseViewController.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import AnimatedCollectionViewLayout

class BrowseViewController: UIViewController {
    let browseView = BrowseView()
    var recipes = [RecipeResult]() {
        didSet {
            browseView.collectionView.reloadData()
        }
    }
    
    var searchWord: String = "apple"
    var requestSize: Int = 6

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        view.addSubview(browseView)
        browseView.collectionView.delegate = self
        browseView.collectionView.dataSource = self
    }
    
   private func fetchData() {
        let request = AF.request("\(AzureConstants.apiURL)?query=\(searchWord)&number=\(requestSize)&apiKey=\(SecretAPIKey.recipeAPIKey)")
    DispatchQueue.main.async {
          request.responseDecodable(of: Recipe.self) { (response) in
            guard let data = response.value else { return }
            self.recipes = data.results
            print(self.recipes.count)
            print(self.recipes[0])
            self.browseView.collectionView.reloadData()
          }
        }
    }
    
}
extension BrowseViewController: UICollectionViewDelegate {
    
}

extension BrowseViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = browseView.collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.recipeCell.rawValue, for: indexPath) as? RecipeCellCollectionViewCell else {return UICollectionViewCell()}
        
        let currentRecipe = recipes[indexPath.row]
        let url = URL(string: AzureConstants.baseImageURL + currentRecipe.imageUrls[0])
        cell.recipeImage.kf.setImage(with: url)
        return cell
    }
    
    
    
}
