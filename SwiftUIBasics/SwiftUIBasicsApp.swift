//
//  SwiftUIBasicsApp.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 19/06/21.
//

import SwiftUI

@main
struct SwiftUIBasicsApp: App {
    var body: some Scene {
        WindowGroup {
           // let navObj = NavModel()
           // NavigationContentView2().environmentObject(navObj)
            // BindableListElements(list: SwiftUIBasicsApp.notes123())
          //  TexField_Style()
            SearchBar()
        }
    }
    
    static func notes123() -> NoteList {
        let note = NoteList()
        note.notes = [Note(id: UUID(), title: "hello", text: "world")]
        return note
    }
}

struct SwiftUIBasicsApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
