//
//  CartModel.swift
//  AzureOverall
//
//  Created by God on 3/29/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import Foundation

struct Cart {
    static var recipes: [RecipeResult]?
    
    static var count: Int {
        get  {
            recipes?.count ?? 0
        }
    }
 
}
