//
//  BackgroundAndOverlays.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 24/01/22.
//

import SwiftUI

/**
 The reason that the above ContentView is rendered across all of the available screen space is because a `LinearGradient` will always occupy as much space as possible by default, and since a any stack’s size defaults to the total size of its children, that leads to our `ZStack` being resized to occupy that same full-screen space.
 */
struct BackgroundAndOverlays1: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            Text("Swift by Salman")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

/**
 The background modifier

 However, sometimes we might not want a given background to stretch out to fill all available space, and while we could address that by applying various sizing modifiers to our background view, SwiftUI ships with a built-in tool that automatically resizes a given view’s background to perfectly fit its parent — the background modifier.
 */
struct BackgroundAndOverlays2: View {
    var body: some View {
        Text("Swift by Salman")
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(35)
            .background(LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

/**
 One thing that’s important to point out, though, is that even though a view’s background does indeed get resized according to the parent view itself, there’s no form of clipping applied by default. So if we were to give our LinearGradient an explicit size that’s larger than its parent, then it’ll actually be rendered out of bounds (which we can clearly demonstrate by adding a border to our main Text-based view):
 
 There are multiple ways to apply clipping to a view, though, which would remove the above sort of out-of-bounds rendering. For example, we could use either the clipped or clipShape modifier to tell the view to apply a clipping mask to its bounds, or we could give our view rounded corners (which also introduces clipping) — like this:
 
 Of course, the simplest way to avoid drawing a background outside of the bounds of its parent view is to simply let the SwiftUI layout system automatically determine the size of each background. That way, the size of a given background will always perfectly match the size of its parent view.
*/
struct BackgroundAndOverlays3: View {
    var body: some View {
        Text("Swift by Salman")
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(35)
            .background(LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing).frame(width: 300, height: 300))
            .border(.blue, width: 5)
            //  .cornerRadius(10)
    }
}

/**
 
 Assigning overlays

 SwiftUI also supports adding overlays to views as well, which essentially act as the inverse of backgrounds — in that they’re rendered on top of their parent views (with the same sizing behaviors as we explored above).
 Both overlays and backgrounds also support alignment customization, which lets us decide how such a view should be placed within its parent’s coordinate system. For views that are fully resizable (like our above LinearGradient), the alignment doesn’t matter (since those views will be resized to fit their parent view anyway), but for smaller views, specifying an alignment lets us move a view to any of its parent’s corners.
 For example, here’s how we could add a star image overlay to the top-trailing corner of our ContentView:
 
 */
struct BackgroundAndOverlays4: View {
    var body: some View {
        Text("Swift by Salman")
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(35)
            .background(LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay(starOverlay, alignment: .topTrailing)
    }
    
    private var starOverlay: some View {
        Image(systemName: "star")
            .foregroundColor(.white)
            .padding([.top, .trailing], 5)
    }
}

/// Conditional overlays and backgrounds
/// 
struct BackgroundAndOverlays5: View {
    
    @State private var isLoading = true
    
    var body: some View {
        Text("Swift by Salman")
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(35)
            .background(LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay(starOverlay, alignment: .topTrailing)
            .overlay(loadingOverlay)
           // .background(Color(white: 0, opacity: 0.75))
            //.border(.blue, width: 5)
            .cornerRadius(20)
    }
    
    private var starOverlay: some View {
        Image(systemName: "star")
            .foregroundColor(.white)
            .padding([.top, .trailing], 5)
    }
    /**
     Since we don’t want to introduce any if/else control flow to our ContentView itself (since that’ll essentially make SwiftUI treat those two code paths as two separate views), we could create such a conditional overlay by defining a new @ViewBuilder-marked computed property — like this:
     
     Note that it’s perfectly fine to apply multiple overlays or backgrounds to a single view. They’ll simply be stacked on top of each other, just like when using a ZStack.
     */
    @ViewBuilder private var loadingOverlay: some View {
        if isLoading {
//            ProgressView()
//                .foregroundColor(.white)
//                .background(Color(white: 0, opacity: 0.75))
            
            ZStack {
                Color(white: 0, opacity: 0.75)
                ProgressView()
                    .tint(.white)
            }
        }
    }
}

struct BackgroundAndOverlays_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlays5()
    }
}
