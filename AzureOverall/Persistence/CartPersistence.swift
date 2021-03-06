//
//  CartPersistence.swift
//  AzureOverall
//
//  Created by God on 3/30/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import Foundation

struct CartPersistenceManager {
    private init() {}
    static let manager = CartPersistenceManager()

     private let persistenceHelper = PersistenceHelper<RecipeResult>(fileName: "cart.plist")

    func saveRecipe(recipe: RecipeResult) throws {
        try persistenceHelper.save(newElement: recipe)

    }

    func getCart() throws -> [RecipeResult] {
        return try persistenceHelper.getObjects()
    }

    func deleteItem(withMessage: Int) throws {
        do {
            let entries = try getCart()
            let newEntries = entries.filter { $0.id != withMessage}
            try persistenceHelper.replace(elements: newEntries)
        }
    }
    func updateCart(newCart: [RecipeResult]) throws  {
        do {
            try persistenceHelper.replace(elements: newCart)
        }
    }
}
