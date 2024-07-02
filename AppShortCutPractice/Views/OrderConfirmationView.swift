//
//  OrderConfirmationView.swift
//  AppShortCutPractice
//
//

import SwiftUI

struct OrderConfirmationView: View {
    
    let order: OrderItem
        
    var body: some View {
        
        VStack {
            HStack {
                Image(order.product.value.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                
                VStack(alignment: .leading) {
                    Text("商品: \(order.product.value.displayTitle)")
                    Text("サイズ: \(order.size.value.displayTitle)")
                }
            }
            .padding()
            
            Divider()
            
            Text("合計: \(order.price)円")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
        .font(.title3)
    }
}

#Preview {
    OrderConfirmationView(order: .init(product: .hamburger, size: .large))
}
