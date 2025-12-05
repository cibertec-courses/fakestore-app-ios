//
//  ProductViewModel.swift
//  fakestore-app-ios
//
//  Created by DamII on 4/12/25.
//

import Foundation

@MainActor
class ProductViewModel: ObservableObject{
    @Published var products: [Product] = []
    @Published var isLoading : Bool = false
    @Published var errorMeesage: String?
    
    func fetchProduct() async{
        isLoading = true
        errorMeesage = nil
        
        do{
            products = try await APIService.shared.getProducts()
        }
        catch{
            errorMeesage = "Error al cargar productoss: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
}
