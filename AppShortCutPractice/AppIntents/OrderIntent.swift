//
//  OrderIntent.swift
//  AppShortCutPractice
//
//

import SwiftUI
import AppIntents

struct OrderIntent: AppIntent {
        
    static var title: LocalizedStringResource = "注文する"
    
    @Parameter(title: "商品名", requestValueDialog: "どの商品にしますか？")
    var product: ProductType
    
    @Parameter(title: "サイズ", requestValueDialog: "どのサイズですか？")
    var size: Size
    
    @MainActor
    func perform() async throws -> some IntentResult {
        let order = OrderItem(product: product, size: size)
        try await requestConfirmation(result: .result(dialog: "こちらの注文でよろしいでしょうか？") {
            OrderConfirmationView(order: order)
        }, confirmationActionName: .order, showPrompt: true)
        
        OrderDataStore.shared.context.insert(order)
        return .result(dialog: "注文が完了しました！")
    }
    
    static var parameterSummary: some ParameterSummary {
        Summary("\(\.$product)を\(\.$size)で注文する")
    }
}
