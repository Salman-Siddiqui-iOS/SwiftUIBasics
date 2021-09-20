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
            
            BindableListElements(list: SwiftUIBasicsApp.notes123())
        }
    }
    
    static func notes123() -> NoteList {
        let note = NoteList()
        note.notes = [Note(id: UUID(), title: "hello", text: "world")]
        return note
    }
}
