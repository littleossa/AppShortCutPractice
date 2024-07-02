//
//  OrderAppShortcuts.swift
//  AppShortCutPractice
//
//

import AppIntents

struct OrderAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OrderIntent(),
            phrases: ["\(.applicationName)でオーダーする",
                      "\(.applicationName)でオーダー",
                      "\(.applicationName)で注文する",
                      "\(.applicationName)で注文"],
            shortTitle: "フードを注文する",
            systemImageName: "takeoutbag.and.cup.and.straw.fill"
        )
        AppShortcut(
            intent: ReorderIntent(),
            phrases: ["\(.applicationName)で注文履歴からオーダーする",
                      "\(.applicationName)で注文履歴からオーダー",
                      "\(.applicationName)で注文履歴から注文する",
                      "\(.applicationName)で注文履歴から注文"],
            shortTitle: "フードを注文履歴から注文する",
            systemImageName: "takeoutbag.and.cup.and.straw.fill"
        )
    }
    
    static var shortcutTileColor: ShortcutTileColor = .grayGreen
}

