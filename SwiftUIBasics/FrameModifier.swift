//
//  SizeModifier.swift
//  SwiftUIBasics
//
//  Created by Salman Siddiqui on 23/10/21.
//

import SwiftUI

// -- Modifiers in SwiftUI do not actually modify views. Most of the time, when we apply a modifier on a view, a new view is created that is wrapped around the view being “modified”. It is that wrapper view that we must think of as the “frame”.

// -- although views do not have frames (at least not in the UIKit/AppKit sense),  **they do have bounds**. These bounds are not directly manipulable. They are an emergent property of the view and its parents.
// -- The frame may or may not have an effect on the size of its child.

struct FrameModifier: View {
    var body: some View {
        // modifier fixes this view at its ideal size.
        /**
         The fixed frame is a way to create an invisible frame around the view that will propose the size you mention to the view. It doesn’t mean that the frame will set the size of the view inside. The frame only suggests the size, and the view can completely ignore it.
         */
        VStack(spacing: 40) {
        Text("Very very very long text!")
            .font(.title)
            .frame(width: 100, height: 100, alignment: .center)
            .border(Color.red)
        
        // the fixed size modifier allows to text to ignore the frame and use as much space as needed to render the content.
        Text("Very very very long text!")
                .font(.title)
                .fixedSize()
                .frame(width: 100, height: 100, alignment: .center)
                .border(Color.red)
            
            /** SwiftUI provides us two versions of fixed size modifier. The first one, which we already used in previous examples, doesn’t have any parameters and allows the view to grow both vertically and horizontally. The second variant of the fixed size modifier accepts two boolean parameters. These parameters describe the axis of expansion. */
            Text("Very very very long text!")
                        .font(.title)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 100, height: 100, alignment: .center)
                        .border(Color.red)
            /**
             In the example above, we have the horizontal stack that contains three text labels. The layout system can’t render all of them without truncating because labels have pretty big font sizes. Assume that we want to display the second label without truncating and allow to SwiftUI cut other labels. We have at least two solutions here. The first one is layout priority, and the second one is the fixed size modifier.
             */
            
            HStack {
                Text("Hello World")
                    .font(.headline)
                Text("Hello World")
                    .font(.largeTitle)
                Text("Hello World")
                    .font(.title)
            }
            
            // As you can see, the fixed size modifier provides us much more control over the layout system than layout priorities.
            HStack {
                Text("Hello World")
                    .font(.headline)
                Text("Hello World")
                    .font(.largeTitle)
                    .fixedSize(horizontal: true, vertical: false)
                Text("Hello World")
                    .font(.title)
                    .fixedSize(horizontal: true, vertical: false)
            }
        }
    }
}



struct FlexibleFrame: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("salman siddiqui")
                .foregroundColor(Color.white)
                .border(Color.green, width: 2)
                .frame(minWidth: 0, minHeight: 50)
                .border(Color.red)
                .frame(width: 300, height: 300)
                .background(Color.black)
            
            Text("Happy WWDC 21!")
                    .foregroundColor(Color.white)
                    .border(Color.green, width: 2)
                    .frame(maxWidth: .infinity)
                    .border(Color.red)
                    .frame(width: 300, height: 300)
                    .background(Color.black)
        }
    }
}

/**
 Ideal width and heigh parameters allow us to provide an intrinsic size. Intrinsic size is usually the size of the content. In the case of the Text view, it is the size of the string presented in the view. In the case of a shape like a Rectangle or Circle, the ideal size is undefined, and the view tries to fill the available space. The frame modifier allows you to provide the ideal size for the views that don’t have content. SwiftUI uses ideal size only in conjunction with the fixedSize modifier.
 
 The natural size of UILabel is the size of the text it contains. The natural size of UIActivityIndicatorView is fixed at 20x20 points. The value from intrinsicContentSize is an amount of space the view needs for its content to display in an ideal state. The value return from intrinsicContentSize isn't final. You can override this value to whatever you want by setting width or height constraints.
 */
struct IdealFrame: View {
    var body: some View {
        VStack {
            // From the Apple Document, .fixedSize fixes the view at its ideal size. This is what we need to apply the ideal size.
            Rectangle()
                .frame(idealWidth: 200, idealHeight: 200)
                .foregroundColor(Color.pink)
                // Fixed horizontal:
                //.fixedSize(horizontal: true, vertical: false)
                // Fixed vertical:
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

/**
 We are using .frame() to change what’s offered to the child. Still, the subview will not take it, if it is below 120. The blue border, however, does show the frame (i.e., the wrapper we talked about at the beginning of this article), is indeed forced to the new size.
 */
struct ExampleView: View {
    
    @State private var width = 50.0
    
    var body: some View {
        VStack {
            SubView()
                .frame(width: width, height: 120)
                .border(Color.blue, width: 2)
            Text("Offered Width \(Int(width))")
            Slider(value: $width, in: 0...200, step: 1)
        }
    }
}

struct SubView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(Color.yellow)
                .frame(width: max(proxy.size.width, 120), height: max(proxy.size.height, 120))
        }
    }
}

struct SizeModifier_Previews: PreviewProvider {
    static var previews: some View {
        FrameModifier()
    }
}
