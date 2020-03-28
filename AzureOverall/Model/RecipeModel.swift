//
//  RecipeModel.swift
//  AzureOverall
//
//  Created by God on 3/27/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit

struct Recipe: Codable {
    let results: [RecipeResult]
    let baseURI: String
    let offset, number, totalResults, processingTimeMS: Int
    let expires: Int

    enum CodingKeys: String, CodingKey {
        case results
        case baseURI = "baseUri"
        case offset, number, totalResults
        case processingTimeMS = "processingTimeMs"
        case expires
    }
}

// MARK: - Result
struct RecipeResult: Codable {
 
    
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let image: String
    let imageUrls: [String]
}
