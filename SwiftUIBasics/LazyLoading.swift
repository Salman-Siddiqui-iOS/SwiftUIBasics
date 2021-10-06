//
//  LazyLoading.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 06/10/21.
//

import SwiftUI

struct LazyLoading: View {
     
    var body: some View {
        // - Takes more memory
        
//         ScrollView {
//             ForEach(0..<2000) { index in
//                 Text("\(index)")
//                    .font(.title)
//                    .frame(width: 200, height: 200)
//                    .background(Color.red)
//                    .onAppear {
//                        print("OnAppear")
//                    }
//                }
//            }
            lazyVStack()
        }
    /**
        - loads on demand
        - uses less memory
        - with LazyVStack we can build more flexible code then *List*
        - native features are not supported like **List** pull to refresh, swipes
        - If we need more customizaation we can go for **LazyVStack** or **LazyHStack**
        - **List** only support Vertical scroll same like *TableView*
     */
    func lazyVStack() -> some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<200) {  index in
                Text("\(index)")
                    .font(.title)
                    .onAppear {
                        print("OnAppear")
                    }
                }
            .frame(width: 200, height: 200)
            .background(Color.red)
            }
        }
    }
}

struct LazyLoading_Previews: PreviewProvider {
    static var previews: some View {
        LazyLoading()
    }
}
