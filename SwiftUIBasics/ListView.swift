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

//  Using a List view is the most efficient way of displaying vertically scrolling data. You can display data in a ScrollView, but it will not be as efficient in terms of memory or performance as the List view.

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

struct List_WithStaticData: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("List")
                .font(.largeTitle)
            Text("Static Data")
                .font(.title).foregroundColor(.gray)
            Text("You can show static views or data within the List view. It does not have to be bound with data. It gives you a scrollable view.")
                .font(.title)
                .padding()
                .background(Color.orange)
            
            List {
                Text("Line One")
                Text("Line two")
                Text("Line three")
                Image("yosemite").resizable().frame(width: 50, height: 50)
                Button("Click here ") {
                    
                }
                .foregroundColor(.orange)
                HStack {
                    Spacer()
                    Text("Centered Text")
                    Spacer()
                }
                .padding()
            }
            .font(.title)
        }
    }
}

struct List_WithData: View {
    var stringArray = ["This is the simplest List", "Evans", "Lemuel James Guerrero", "Mark",
    "Durtschi", "Chase", "Adam", "Rodrigo", "Notice the automatic wrapping when the content is larger"]
    
    var body: some View {
        List(stringArray, id: \.self) { str in
            Text(str)
        }
        .font(.largeTitle)
    }
}

struct List_Grouped: View {
    var data = ["Grouped List Style", "This list is using the group list style", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo"]
    var body: some View {
        List(data, id: \.self) {
            data in
            if #available(iOS 15.0, *) {
                Section(header: Text("Names"), footer: Text("All Names")) {
                    Text(data)
                }
                .listSectionSeparator(.visible)
            } else {
                // Fallback on earlier versions
            }
        }.listStyle(.grouped)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        List_Grouped()
    }
}
