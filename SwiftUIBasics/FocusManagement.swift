//
//  FocusManagement.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 03/11/21.
//

import SwiftUI

struct FocusManagement: View {
    var body: some View {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<100) { index in
                        ZStack {
                            Poster()
                        } 
                    }
             }
        }
    }
}

struct Poster: View {
    
    @Environment(\.isFocused) var isFocused 
    
    var body: some View {
            RoundedRectangle(cornerRadius: 8)
            .frame(width: 100, height: 150)
            .scaleEffect(isFocused ? 1.2 : 1)
    }
}


struct FocusManagement_Previews: PreviewProvider {
    static var previews: some View {
        Poster()
    }
}
