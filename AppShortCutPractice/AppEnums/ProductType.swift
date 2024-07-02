//
//  ProductType.swift
//  AppShortCutPractice
//
//

import AppIntents

enum ProductType: String, Codable {
    case hamburger
    case beer
    
    var value: Value {
        switch self {
        case .hamburger:
            return Value(displayTitle: "ハンバーガー",
                         basePrice: 300,
                         imageName: "hamburger")
        case .beer:
            return Value(displayTitle: "ビール",
                         basePrice: 200,
                         imageName: "beer")
        }
    }
    
    struct Value {
        let displayTitle: LocalizedStringResource
        let basePrice: Double
        let imageName: String
    }
}

extension ProductType: AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "商品"
    
    static var caseDisplayRepresentations: [ProductType: DisplayRepresentation] = [
        .hamburger: "ハンバーガー",
        .beer: "ビール"
    ]
}

