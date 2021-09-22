//
//  Layers.swift
//  SwiftUIBigMountain
//
//  Created by salman siddiqui on 22/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Only one view can be returned from the body property.
        // Add 20 points between views within this container.
        // The body property can only return one view.
        // Note: spacing does not add spacing to the top or bottom of the VStack.
        VStack(spacing: 20) {
        Text("Title")
            .font(.largeTitle)
        Text("Subtitle")
            .foregroundColor(.gray)
        Text("Short description what I am demonstrating goes here.")
                .frame(maxWidth: .infinity)
                .padding()
               // Extend until you can't go anymore.
                .foregroundColor(.white)
                .background(Color.blue)
             // This text view has the highest priority over theother views in this VStack for the calculation of the space it needs on the screen.
                .layoutPriority(1)
            
            // The important thing to notice here is it is not a backgroundColor modifier. That does not exist. It is a background modifier because it adds a layer behind the view.
            // Color.blue is actually a view. So the background modifier is adding a blue view on a layer behind the text.
        }
        .font(.title)
        // This font style will be applied to all text views inside the VStack.
        // Why isn’t the title text view affected? Because the title text view sets the font again, it overrides the title size with the largeTitle size.
    }
}


// MARK: - Layout Priority
struct LayoutPriority: View {
    var body: some View {
        HStack {
            Text("SwiftUI")
                .font(.largeTitle)
                .lineLimit(1)
                .layoutPriority(1)
            Image("yosemite")
                .resizable()
                .frame(width: 80, height: 80)
            Text("Bring balance")
                .font(.largeTitle)
                .lineLimit(1)
                .layoutPriority(10)
        }
    }
}


// MARK: - Layer
struct Layers: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Layers")
            Text("The Basics")
            Text("With SwiftUI views, you can add layers on top (.overlay) and behind(.background) the view.")
            Image("yosemite")
                .resizable()
            .frame(width: 200, height: 200)
            // Layer behind image   .background(Color.red.opacity(0.3))
            .background(Color.yellow.opacity(0.3))
            .background(Color.blue.opacity(0.3))
            .overlay(Text("yosemite"))
            // Layer on top of image
        }
    }
}


struct Layers_Previews: PreviewProvider {
    static var previews: some View {
        Layers()
    }
}
