//
//  CartScreenViewController.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit
import Kingfisher
class CartScreenViewController: UIViewController {
    let cartScreen = CartScreenView()
    
    var cart = [RecipeResult]() {
        didSet {
            cartScreen.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(cartScreen)
        cartScreen.tableView.delegate = self
        cartScreen.tableView.dataSource = self
        loadCart()
    }
    
    private func loadCart() {
        cart = try! CartPersistenceManager.manager.getCart()
    }

}

extension CartScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = cartScreen.tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartCell.rawValue, for: indexPath) as? CartItemCell else {return UITableViewCell()}
        let currentCartItem = cart[indexPath.row]
        cell.title.text = currentCartItem.title
        let url = URL(string: AzureConstants.baseImageURL + currentCartItem.imageUrls[0])
        cell.recipeImageView.kf.setImage(with: url)
        return cell
    }
    
    
}

extension CartScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.currentRecipe = cart[indexPath.row]
        detailVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
