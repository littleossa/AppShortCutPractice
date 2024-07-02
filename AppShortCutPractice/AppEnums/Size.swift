//
//  Size.swift
//  AppShortCutPractice
//
//

import AppIntents

enum Size: String, Codable {
    case small
    case medium
    case large
    
    var value: Value {
        switch self {
        case .small:
            return Value(displayTitle: "S",
                         priceMultiplier: 1.0)
        case .medium:
            return Value(displayTitle: "M",
                         priceMultiplier: 1.5)
        case .large:
            return Value(displayTitle: "L",
                         priceMultiplier: 2.0)
        }
    }
    
    struct Value {
        let displayTitle: LocalizedStringResource
        /// サイズによって価格を調整するための係数
        let priceMultiplier: Double
    }
}

extension Size: AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "サイズ"
    
    static var caseDisplayRepresentations: [Size: DisplayRepresentation] = [
        .small: "S",
        .medium: "M",
        .large: "L"
    ]
}

