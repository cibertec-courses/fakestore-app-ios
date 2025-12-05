//
//  ProductCardView.swift
//  fakestore-app-ios
//
//  Created by DamII on 4/12/25.
//

import SwiftUI

struct ProductCardView : View{
    
    let product: Product
    
    var body: some View{
        VStack(alignment: .leading, spacing:8){
            
            AsyncImage(url: URL(string: product.image)){ phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 150)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                case .failure:
                    Image(systemName: "photo")
                        .frame(height: 150)
                @unknown default:
                    EmptyView()
                }
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            
            Text(product.title)
                .font(.caption)
                .lineLimit(2)
            
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            HStack(spacing: 4){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption)
                
                Text("\(product.rating.rate, specifier: "%.2f")")
                    .font(.caption)
                
                Text("(\(product.rating.count)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}


struct ProductCardView_Previews: PreviewProvider{
    static var previews: some View{
        ProductCardView(product: Product(
            id: 1,
            title: "Producto X",
            price: 99.99,
            description: "Producto x en descuento",
            category: "Test",
            image:  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
            rating:  Rating(rate: 4.5, count: 210)
        ))
        .frame(width: 180)
        .previewLayout(.sizeThatFits)
    }
}
