//
//  ContentView.swift
//  AppShortCutPractice
//
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \OrderItem.orderDate, order: .reverse) private var items: [OrderItem]

    var body: some View {
        
        NavigationStack {
            if items.isEmpty {
                Text("注文履歴はありません")
            } else {
                List {
                    ForEach(items) { item in
                        VStack(alignment: .trailing) {
                            HStack {
                                Image(item.product.value.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48)
                                
                                Spacer()
                                
                                Text(item.product.value.displayTitle)
                                Text(item.size.value.displayTitle)
                            }
                            .font(.title)
                            
                            Text(item.orderDate,
                                 format: Date.FormatStyle(date: .numeric,
                                                          time: .standard))
                            .font(.caption)
                            .foregroundStyle(.gray)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("注文履歴")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: OrderItem.self, inMemory: true)
}
