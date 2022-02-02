//
//  SearchBar.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 05/01/22.
//

import SwiftUI

struct SearchBar: View {
    @State private var query: String = ""
    @State private var message: [String] = ["Hello", "world"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(message, id: \.self) { message in
                    Text(message)
                }
            }
            .searchable(text: $query)
            .navigationTitle("Messages")
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
