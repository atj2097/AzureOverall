//
//  AppError.swift
//  AzureOverall
//
//  Created by God on 3/30/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//
import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
