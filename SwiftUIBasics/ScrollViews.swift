//
//  ScrollViews.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 23/09/21.
//

import SwiftUI

// A ScrollView is like a container for child views. When the child views within the ScrollView go outside the frame, the user can scroll to bring the child views that are outside the frame into view.
// A ScrollView is a push-out view in the scroll direction you specify. You can set the direction of a ScrollView to be vertical or horizontal.
// A Scrollview with a ForEach view is similar to a List.
// *** But be warned, the rows are not reusable. It is best to limit the number of rows for memory and performance considerations.
struct ScrollViews: View {
    
    @State private var names = ["Scott", "Mark", "Chris", "Sean", "Rod", "Meng", "Natasha", "Chase",
                                "Evans", "Paul", "Durtschi", "Max"]
    
    var body: some View {
        ScrollView {
            ForEach(names, id: \.self) { name in
                HStack {
                    Text(name).foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.right.circle.fill")
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
                .shadow(radius: 1, y: 1)
            }
        }
    }
}

struct Scrollview_Horizontally: View {
    var items = [Color.green, Color.blue, Color.purple, Color.pink, Color.yellow, Color.orange]
    var body: some View {
        VStack {
            Text("ScrollView")
                .font(.largeTitle)
            Text("Scroll Horizontally")
                .font(.title)
            Text("Just set the ScrollView's axis to horizontal and if the contents go horizontally beyond the frame, scrolling will be enabled.")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(items, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item)
                            .frame(width: 200, height: 200)
                    }
                }
            }
            .padding()
        }
    }
}

struct ScrollViews_Previews: PreviewProvider {
    static var previews: some View {
        Scrollview_Horizontally()
    }
}
