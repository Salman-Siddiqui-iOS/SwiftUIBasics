@_private(sourceFile: "SwiftUIBasicsApp.swift") import SwiftUIBasics
import SwiftUI
import SwiftUI

extension SwiftUIBasicsApp_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/apple/Library/Mobile Documents/com~apple~CloudDocs/iOS Dev/Playground/SwiftUI/SwiftUIBasics/SwiftUIBasics/SwiftUIBasicsApp.swift", line: 31)
        /*@START_MENU_TOKEN@*/Text(__designTimeString("#9023.[2].[0].property.[0].[0].arg[0].value", fallback: "Hello, World!"))/*@END_MENU_TOKEN@*/
    #sourceLocation()
    }
}

extension SwiftUIBasicsApp {
    @_dynamicReplacement(for: notes123()) private static func __preview__notes123() -> NoteList {
        #sourceLocation(file: "/Users/apple/Library/Mobile Documents/com~apple~CloudDocs/iOS Dev/Playground/SwiftUI/SwiftUIBasics/SwiftUIBasics/SwiftUIBasicsApp.swift", line: 23)
        let note = NoteList()
        note.notes = [Note(id: UUID(), title: __designTimeString("#9023.[1].[1].[1].[0]", fallback: "hello"), text: __designTimeString("#9023.[1].[1].[1].[1]", fallback: "world"))]
        return note
    #sourceLocation()
    }
}

import struct SwiftUIBasics.SwiftUIBasicsApp
import struct SwiftUIBasics.SwiftUIBasicsApp_Previews