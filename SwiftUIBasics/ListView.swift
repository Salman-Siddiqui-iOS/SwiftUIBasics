//
//  ListView.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 20/06/21.
//

import SwiftUI

// In UIKit equivalent was UITableView
// List provides scrolling table of data
// Same like form representation of data rather then requesting user data

struct ListView: View {
    let people = ["hello", "world", "salman", "siddiqui"]
    var body: some View {
      /*  List {
            // combination of dynamic and static content
            Section(header: Text("Section header 1")) {
                Text("Static row 1")
                Text("Static row 2")
            }
            Text("Static row 1")
            Text("Static row 2")
            
            ForEach(0..<5) { row in
                Text("Dynamic row \(row)")
            }
            
            Text("Static row 3")
            Text("Static row 4")
        }
        .listStyle(.grouped)
    } */
    //  One thing list can do where Form can't generate dynamic content without need of ForEach loop
    //  which allows to create quickly
    //    List(0..<5) {
    //        Text("Dynamic row:")
    //   }
    // creates rows when its needed if number of rows are more
        List(people, id: \.self) {
            Text($0)
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
