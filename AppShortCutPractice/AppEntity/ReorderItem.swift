//
//  ReorderItem.swift
//  AppShortCutPractice
//
//

import AppIntents

struct ReorderItem: Identifiable {
    let id: UUID
    let product: ProductType
    let size: Size
    let orderDate: Date
    
    init(orderItem: OrderItem) {
        self.id = orderItem.orderID
        self.product = orderItem.product
        self.size = orderItem.size
        self.orderDate = orderItem.orderDate
    }
}

extension ReorderItem: AppEntity {
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        return "再注文商品"
    }
    
    var displayRepresentation: DisplayRepresentation {
        let title: LocalizedStringResource = "\(product.value.displayTitle)の\(size.value.displayTitle)サイズ"
        return DisplayRepresentation(title: title)
    }
    
    static var defaultQuery: ReorderItemQuery = ReorderItemQuery()
}

// MARK: - EntityQuery for ReorderItem
struct ReorderItemQuery: EntityQuery {
    
    func entities(for identifiers: [UUID]) async throws -> [ReorderItem] {
        var items: [ReorderItem] = []
        for i in 0..<identifiers.count {
            if let item = await OrderDataStore.shared.fetchItem(id: identifiers[i]) {
                items.append(ReorderItem(orderItem: item))
            }
        }
        return items
    }
    
    func suggestedEntities() async throws -> [ReorderItem] {
        let items = await OrderDataStore.shared.fetchRecentFiveOrders()
        return items.compactMap({ ReorderItem(orderItem: $0) })
    }
}
