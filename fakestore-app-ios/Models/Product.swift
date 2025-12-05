//
//  Product.swift
//  fakestore-app-ios
//
//  Created by DamII on 4/12/25.
//

import Foundation

struct Product : Identifiable, Codable{
    let id: Int
    let title: String
    let price: Double
    let description : String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable{
    let rate: Double
    let count: Int
    
}
