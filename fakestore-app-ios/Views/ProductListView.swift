//
//  ProductListView.swift
//  fakestore-app-ios
//
//  Created by DamII on 4/12/25.
//

import SwiftUI

struct ProductListView: View{
    
    @StateObject private var viewModel = ProductViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View{
        NavigationView{
            Group{
                if viewModel.isLoading{
                    ProgressView("Cargando productos...")
                } else if let error = viewModel.errorMeesage{
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }else {
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 16){
                            ForEach(viewModel.products){product in
                                ProductCardView(product: product)
                            }
                        }
                    }
                }
            }
            .navigationTitle("FakeStore")
            .task{
                await viewModel.fetchProduct()
            }
        }
    }
    
}


struct ProductListView_Previews : PreviewProvider{
    static var previews: some View {
        ProductListView()
    }
}
