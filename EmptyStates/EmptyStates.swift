//  /*
//
//  Project: EmptyStates
//  File: EmptyStateView.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.12.2023
//
//  */

import SwiftUI

struct EmptyStateView: View {
    @State private var heroes = ["Iron Man", "Captian America", "Black Panther", "Captian Marvel", "Wolverine", "Kang", "Hulk", "Thanos"]
    @State private var searchTerm = ""
    
    var filteredHeroes: [String] {
        guard !searchTerm.isEmpty else { return heroes }
        return heroes.filter { $0.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List(filteredHeroes, id: \.self) { hero in
                    Text(hero)
                }
                .searchable(text: $searchTerm)
                .overlay {
                    if filteredHeroes .isEmpty {
                        ContentUnavailableView.search(text: searchTerm)
                    }
                }
            }
            .navigationTitle("Heroes")
        }
    }
}

#Preview {
    EmptyStateView()
}
