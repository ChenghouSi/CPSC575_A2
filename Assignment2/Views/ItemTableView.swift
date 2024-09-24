//
//  ItemTableView.swift
//  Assignment2
//
//  Created by Chenghou Si on 2024-10-07.
//

import SwiftUI

struct ItemTableView: View {
    @State private var items = AllItems().items
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(searchResult) { item in
                    ItemView(item: item)
                }
                .onDelete { items.remove(atOffsets: $0) }
                .onMove { items.move(fromOffsets: $0, toOffset: $1) }
            }
            .navigationTitle("All Item List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
        .searchable(text: $searchText, prompt: "Looking for a product or grocery store?")
    }
    
    var searchResult: [TableItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.productName.lowercased().contains(searchText.lowercased()) ||
                $0.location.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    ItemTableView()
}
