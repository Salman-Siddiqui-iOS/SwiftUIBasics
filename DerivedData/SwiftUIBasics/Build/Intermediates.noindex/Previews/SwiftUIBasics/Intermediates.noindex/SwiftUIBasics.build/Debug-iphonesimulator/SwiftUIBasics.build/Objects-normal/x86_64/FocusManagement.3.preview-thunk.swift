@_private(sourceFile: "FocusManagement.swift") import SwiftUIBasics
import SwiftUI
import SwiftUI

extension FocusManagement_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/apple/Library/Mobile Documents/com~apple~CloudDocs/iOS Dev/Playground/SwiftUI/SwiftUIBasics/SwiftUIBasics/FocusManagement.swift", line: 30)
        __designTimeSelection(Poster(), "#9080.[3].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension Poster {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/apple/Library/Mobile Documents/com~apple~CloudDocs/iOS Dev/Playground/SwiftUI/SwiftUIBasics/SwiftUIBasics/FocusManagement.swift", line: 21)
            __designTimeSelection(RoundedRectangle(cornerRadius: __designTimeInteger("#9080.[2].[1].property.[0].[0].arg[0].value", fallback: 8))
            .frame(width: __designTimeInteger("#9080.[2].[1].property.[0].[0].modifier[0].arg[0].value", fallback: 100), height: __designTimeInteger("#9080.[2].[1].property.[0].[0].modifier[0].arg[1].value", fallback: 150))
            .scaleEffect(__designTimeSelection(isFocused, "#9080.[2].[1].property.[0].[0].modifier[1].arg[0].value.if") ? __designTimeFloat("#9080.[2].[1].property.[0].[0].modifier[1].arg[0].value.then", fallback: 1.2) : __designTimeInteger("#9080.[2].[1].property.[0].[0].modifier[1].arg[0].value.else", fallback: 1)), "#9080.[2].[1].property.[0].[0]")
    #sourceLocation()
    }
}

extension FocusManagement {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/apple/Library/Mobile Documents/com~apple~CloudDocs/iOS Dev/Playground/SwiftUI/SwiftUIBasics/SwiftUIBasics/FocusManagement.swift", line: 12)
        __designTimeSelection(Text(/*@START_MENU_TOKEN@*/__designTimeString("#9080.[1].[0].property.[0].[0].arg[0].value", fallback: "Hello, World!")/*@END_MENU_TOKEN@*/), "#9080.[1].[0].property.[0].[0]")
    #sourceLocation()
    }
}

import struct SwiftUIBasics.FocusManagement
import struct SwiftUIBasics.Poster
import struct SwiftUIBasics.FocusManagement_Previews