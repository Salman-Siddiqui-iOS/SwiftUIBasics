//
//  GridView.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 21/06/21.
//

import SwiftUI

struct GridView: View {
    
    let data = Array(1...1000).map { "Item \($0)"}
    let layout = [GridItem(.flexible(maximum: 80)), GridItem(.flexible(maximum: 80))]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    VStack {
                        Capsule()
                            .fill(Color.blue)
                            .frame(height: 50)
                        Text(item)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
