//
//  OrderItem.swift
//  AppShortCutPractice
//
//

import Foundation
import SwiftData

@Model
final class OrderItem {
    let orderID: UUID
    let product: ProductType
    let size: Size
    let orderDate: Date
    
    init(orderID: UUID = UUID(),
         product: ProductType,
         size: Size,
         orderDate: Date = .now) {
        self.orderID = orderID
        self.product = product
        self.size = size
        self.orderDate = orderDate
    }
    
    /// 商品とサイズから算出した価格
    var price: Int {
        let price = product.value.basePrice * size.value.priceMultiplier
        return Int(round(price))
    }
}
