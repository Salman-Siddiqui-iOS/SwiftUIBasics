//
//  ViewBuildersTest.swift
//  SwiftUIBasics
//
//  Created by APPLE on 18/09/21.
//

import SwiftUI

struct ViewBuildersTest: View {
    
    @State private var isSquare = true
    
    var body: some View {
        NavigationView {
            Button {
                isSquare.toggle()
            } label : {
                squareOrCircle()
            }
            .navigationTitle("The Basics")
        }
    }
}

extension ViewBuildersTest {
    // util method
  @ViewBuilder func squareOrCircle() -> some View {
      /*  if isSquare {
             RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 100, height: 100)
        } else {
             Circle()
        } */
      
        // In this container I can add
        // what is required like Text
        // in future button
        MyContainer {
          Text("Hello")
          Text("Salman")
        }
    }
}

// custom conatiners
// we can do this with View but upfront we need to deside what all want
struct MyContainer<Content: View>: View {
    let content: Content
    let bgColor: Color
    let fgColor: Color
    init(bgColor: Color = .green,fgColor: Color = .white, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.bgColor = bgColor
        self.fgColor = fgColor
    }
    
    var body: some View {
        VStack {
            content
        }
        .background(RoundedRectangle(cornerRadius: 10).fill( bgColor))
        .foregroundColor(fgColor)
    }
}

struct ViewBuildersTest_1: View {
    var body: some View {
        Carousel {
            Text("Salman")
            Text("Salman")
            Text("Salman")
        }
    }
}

 
struct Carousel<Content: View>: View {
    
    var content: () -> Content
    /// That’s a good start, but our current implementation does have a quite major limitation compared to SwiftUI’s built-in containers — we’re currently only able to pass a single Content view to it.
    /// Although we could address the above problem by wrapping all of our subviews within a Group (which would again give us a single return value within our closure), having to do that at every call site would be quite inconvenient. Thankfully, though, there’s a better way — and that’s to annotate our content closure with SwiftUI’s ViewBuilder attribute, like this:
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(content: content).padding()
        }
    }
}

/// However, if our code base includes multiple kinds of container views, then always having to repeat the above initializer declaration can become a bit repetitive, especially since the required syntax is quite complex.

struct ViewBuildersTest_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuildersTest_1()
    }
}
