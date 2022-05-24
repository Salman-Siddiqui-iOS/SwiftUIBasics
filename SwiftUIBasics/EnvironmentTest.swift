//
//  EnvironmentTest.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 13/12/21.
//

/**
 **Environment inheritance*
 One of a mechanism that SwiftUI use to pass data from one view to another is via `@Environment`
 
 Every view inside SwiftUI inherits Environment from its parent view by default. But remember that you can override any values you want while creating the child view by attaching Environment modifier.
 
 An easy way to do this is through the .environmentObject view modifier. The one downside of this view modifier and corresponding `@EnvironmentObject` property wrapper is that the object you add to the environment must be an *observable object*.
 
 The significant benefit of using Environment and not passing ObservableObject via the init method of the view is the internal SwiftUI storage. SwiftUI stores Environment in the special framework memory outside the view. It gives an implicit access to view-specific Environment for all child views.
 * use environment objects when multiple views need to be able to modify view state or model data and get updated when data changes.
 * But for passing UI specific values that only influence the layout of the views, we prefer to use environment variables.
*/


import SwiftUI

struct EnvironmentTest: View {
    
    @Environment(\.captionBackgroundColor) var captionBackgroundColor
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(captionBackgroundColor)
    }
}

struct EnvironmentTest_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentTest().environment(\.captionBackgroundColor, .red)
             
    }
}

/// **Custom Environment keys**
///
/// To define Environment values you need two things.

/// - EnvironmentKey
/// - EnvironmentValues

private struct CaptionColorKey: EnvironmentKey {
    static let defaultValue = Color(.secondarySystemBackground)
}

extension EnvironmentValues {
    var captionBackgroundColor: Color {
        get { self[CaptionColorKey.self] }
        set { self[CaptionColorKey.self] = newValue }
    }
}

//---------Second Example -----

struct SizeConstants {
    static let narrowWidth: CGFloat = 450
    static let smallHeight: CGFloat = 320
}

struct ParentSizeEnvironmentKey: EnvironmentKey {
    static let defaultValue: CGSize? = nil
}

extension EnvironmentValues {
    var parentSize: CGSize? {
        get {
            return self[ParentSizeEnvironmentKey.self]
        }
        
        set {
            self[ParentSizeEnvironmentKey.self] = newValue
        }
    }
}

extension View {
    func parentSize(_ size: CGSize?) -> some View {
        return self.environment(\.parentSize, size)
    }
}

struct EnvironmentTest2: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 16) {
                AppDescription()
            }
            .parentSize(geo.size)
        }
    }
}

struct AppDescription: View {
    
    @Environment(\.parentSize) var parentSize
    
    var hasSmallHeight: Bool {
        if let parentSize = parentSize,
                    parentSize.height <= SizeConstants.smallHeight {
                    return true
                }
                return false
    }
    
    var body: some View {
        VStack(spacing: 16) {
                    Text("App Title")
                        .font(.title)
                    Text("This is a really great app.")
                        .font(.headline)
                    
                    if !hasSmallHeight {
                        Text("""
                        This app lets you do lots of amazing things.
                        You should definitely consider subscribing now.
                        """)
                    }
                }
                .multilineTextAlignment(.center)
    }
}
