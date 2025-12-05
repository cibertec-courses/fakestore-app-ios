//
//  APIService.swift
//  fakestore-app-ios
//
//  Created by DamII on 4/12/25.
//

import Foundation

class APIService{
    static let shared = APIService()
    
    private let baseURL = "https://fakestoreapi.com"
    
    private init (){
    }
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "\(baseURL)/products") else{
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let products = try JSONDecoder().decode([Product].self, from: data)
        
        return products
        
    }
    
}
