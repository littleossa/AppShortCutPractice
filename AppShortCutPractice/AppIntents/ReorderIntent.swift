//
//  ReorderIntent.swift
//  AppShortCutPractice
//
//

import AppIntents
import SwiftUI

struct ReorderIntent: AppIntent {
    
    static var title: LocalizedStringResource = "注文履歴から注文する"
    
    @Parameter(title: "注文履歴", requestValueDialog: "どちらを再注文しますか？")
    var item: ReorderItem?
    
    @MainActor
    func perform() async throws -> some ProvidesDialog {
        let reorderItem = try await $item.requestDisambiguation(
            among: OrderDataStore.shared.fetchRecentFiveOrders().map({ ReorderItem(orderItem: $0) }),
            dialog: IntentDialog("どちらの商品を再注文しますか?")
        )
        
        let order = OrderItem(product: reorderItem.product, size: reorderItem.size)
        try await requestConfirmation(result: .result(dialog: "こちらの注文でよろしいでしょうか？") {
            OrderConfirmationView(order: order)
        }, confirmationActionName: .order, showPrompt: true)
        
        OrderDataStore.shared.context.insert(order)
        return .result(dialog: "注文が完了しました！")
    }
    
    static var parameterSummary: some ParameterSummary {
        Summary("\(\.$item)を再注文する")
    }
}
