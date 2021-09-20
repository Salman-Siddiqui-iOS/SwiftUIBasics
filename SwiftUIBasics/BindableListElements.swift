//
//  BindableListElements.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 25/06/21.
//

import SwiftUI

struct Note: Hashable, Identifiable {
    let id: UUID
    var title: String
    var text: String
}

class NoteList: ObservableObject {
    @Published var notes: [Note]!
}

struct NoteListView: View {
    @Binding var note: Note
    
    var body: some View {
        Text(note.text)
    }
}

struct BindableListElements: View {
    @ObservedObject var list: NoteList
    
    var body: some View {
        VStack {
            List($list.notes) { $note in
                NoteListView(note: $note)
            }
            // but when it comes to collections, things are often not quite as straightforward.
            // we can’t directly mutate a value within a classic for loop — the note arguments that are being passed into our ForEach closure are all immutable, non-bindable values.
            ForEach($list.notes) { $note in
                NoteListView(note: $note)
            }
            Button("Add") {
                list.notes.append(Note(id: UUID(), title: "hello", text: "world"))
            }
            Spacer()
        }
    }
}

struct BindableListElements_Previews: PreviewProvider {
    static var previews: some View {
        BindableListElements(list: BindableListElements_Previews.notes123())
    }
    
    static func notes123() -> NoteList {
        let note = NoteList()
        note.notes = [Note(id: UUID(), title: "hello", text: "world")]
        return note
    }
}
