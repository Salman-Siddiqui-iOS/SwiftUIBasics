//
//  GeometryReader.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 24/09/21.
//

import SwiftUI

/**
    - It is difficult, if not impossible, to get the size of a view. This is where the GeometryReader comes in.
    - The GeometryReader is similar to a push-out container view in that you can add child views to.
    - It will allow you to inspect and use properties that can help with positioning other views within it.
    - you can access properties like height, width and safe area insets which can help you dynamically set the sizes of views within it so they look good on any size device.
*/

struct GeometryReader_Intro: View {
    var body: some View {
        VStack {
            Text("GeometryReader")
                            .font(.largeTitle)
            Text("Introduction")
                            .font(.title)
                            .foregroundColor(.gray)
            Text("GeometryReader is a container view that pushes out to fill up all available space. You use it to help with positioning items within it.").font(.title).padding()
            
            GeometryReader { _ in
                Text("Views center automatically inside the GeometryReader")
                    .font(.title)
            }
            .background(Color.pink)
            .foregroundColor(.white)
        }
    }
}

struct GeometryReader_Positioning: View {
    var body: some View {
        VStack {
            Text("GeometryReader").font(.largeTitle)
            Text("Positioning").font(.title).foregroundColor(.gray)
            Text("Use the geometry reader's variable to help position child views at different locations within the geometry's view instead of it being in the center.")
                .font(.title)
                .layoutPriority(1)
                .padding()
            GeometryReader { geomertry in
                Text("Upper Left")
                    .font(.title)
                Text("Lower Right")
                    .font(.title)
                    .position(x: geomertry.size.width - 90, y: geomertry.size.height - 90)
                Text("The local coordinate space will always give you zeros.").position(x: 100, y: 150)
                Text("X: \(geomertry.frame(in: CoordinateSpace.local).origin.x)")
                    .position(x: 100, y: 100)
                Text("Y: \(geomertry.frame(in: CoordinateSpace.local).origin.y)")
                    .position(x: 200, y: 100)
            }
            .background(Color.pink)
            .foregroundColor(.white)
            .frame(height: 400)
            
            GeometryReader { geometry in
                    VStack(spacing: 10) {
                        Text("X: \(geometry.frame(in: .global).origin.x)")
                        Text("Y: \(geometry.frame(in: .global).origin.y)")
            }
                    .foregroundColor(.white)
                }
                .background(Color.pink)
                .frame(height: 200)
        }
    }
}

struct GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_Positioning()
    }
}
