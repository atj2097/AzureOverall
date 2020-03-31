//
//  APIClient.swift
//  AzureOverall
//
//  Created by God on 3/30/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import Foundation

import Foundation

class RecipeApiClient {
    
    static func getUrlStr(foodName: String, count: Int) -> String {
        return "https://api.spoonacular.com/recipes/search?apiKey=\(SecretAPIKey.recipeAPIKey)&number=\(count)&query=\(foodName)"
    }
    
    static let manager = RecipeApiClient()
    
    func getRecipeData(urlStr: String, completionHandler: @escaping (Result<[RecipeResult], AppError>) -> ())  {
        
        guard let url = URL(string: urlStr) else {
            print(AppError.badURL)
            return
        }
        
        NetworkManager.manager.performDataTask(withUrl: url, andMethod: .get) { (results) in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let results = try RecipeResult.decodeRecipeFromData(from: data)
                    completionHandler(.success(results))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    private init() {}
}

