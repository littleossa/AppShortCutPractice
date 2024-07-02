//
//  SwiftDataStore.swift
//  AppShortCutPractice
//
//

import SwiftData
import Foundation

class OrderDataStore {
    
    private init() {
        let schema = Schema([
            OrderItem.self,
        ])
        let configuration = ModelConfiguration(schema: schema,
                                               isStoredInMemoryOnly: false)
        
        do {
            container = try ModelContainer(for: schema,
                                           configurations: [configuration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    static let shared = OrderDataStore()
    
    let container: ModelContainer
    
    @MainActor
    var context: ModelContext {
        return container.mainContext
    }
}

extension OrderDataStore {
    
    @MainActor
    func fetchItem(id: UUID) -> OrderItem? {
        let descriptor = FetchDescriptor<OrderItem>(predicate: #Predicate { $0.orderID == id })
        if let item = try? context.fetch(descriptor).first {
            return item
        } else {
            return nil
        }
    }
    
    @MainActor
    func fetchRecentFiveOrders() -> [OrderItem] {
        var descriptor = FetchDescriptor<OrderItem>(sortBy: [SortDescriptor(\.orderDate, order: .reverse)])
        descriptor.fetchLimit = 5
        if let items = try? context.fetch(descriptor) {
            return items
        } else {
            return []
        }
    }
}
