//
//  Stacks.swift
//  SwiftUIBigMountain
//
//  Created by salman siddiqui on 22/09/21.
//

import SwiftUI

// MARK:- VStack

// VStack stands for “Vertical Stack”. It is a pull-in container view in which you pass in up to ten views and it will compose them one below the next, going down the screen.
struct VStackContainer: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("VStack")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            Text("VStacks are views that contain other views")
                .frame(maxWidth: .infinity, minHeight: 70)
                .padding().font(.title)
                .background(Color.blue)
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text("VStack inside another VStack")
                    .font(.title)
                Divider()
                Text("This can be handy. Why?")
                Divider()
                Text("More than 10 views creates an error.")
            }
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.blue)
            .padding()
        }
    }
}

// HStack stands for “Horizontal Stack”. It is a pull-in container view in which you pass in up to ten views and it will compose them side-by-side.
struct HStackContainer: View {
    var body: some View {
        VStack {
            Text("HStack").font(.largeTitle)
            Text("Introduction")
                    .font(.title).foregroundColor(.gray)
            HStack {
                    Text("Leading")
                    Text("Middle")
                    Text("Trailing")
                }
            .padding()
            .border(.orange)
            // Create a 2 point border using the color specified
            HStack(spacing: 10) {
                    Image(systemName: "1.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "3.circle")
            }.padding()
            
            HStack(spacing: 40) {
                    Image(systemName: "a.circle.fill")
                    Image(systemName: "b.circle.fill")
                    Image(systemName: "c.circle.fill")
                    Image(systemName: "d.circle.fill")
                    Image(systemName: "e.circle.fill")
                }
            .font(.largeTitle).padding()
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.orange))
            Text("By default, views within an HStack are vertically aligned in the center.")
            HStack(alignment: .top) {
                Rectangle().foregroundColor(.orange).frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Top")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)
        }
    }
}


/**
 - A ZStack is a push-out container view.
 - It is a view that overlays its child      views on top of each other.
 - (“Z” represents the Z-axis which is       depth-based in a 3D space.)
 - The ZStack is a pull-in container view.   You may think it is a push-out view       because of the first example but it’s     actually the color that is pushing out
 */

struct Stack_ZStack: View {
    var body: some View {
        ZStack {
            Color.gray
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                Text("Introductions")
                    .font(.title)
                    .foregroundColor(.white)
                Text("ZStacks are great for setting a background color.")
                    .foregroundColor(.black)
                    .background(Color.green).lineLimit(2)
                Text("But notice the Color stops at the Safe Areas (white areas on top and bottom).").foregroundColor(.black)
                    .background(Color.green).lineLimit(2)
                    
            }
            .padding()
            .font(.title)
        }
    }
}

struct ZStack_IgnoreSafeArea: View {
    var body: some View {
        ZStack {
            Color.gray
            VStack(spacing: 20) {
                    Text("ZStack")
                        .font(.largeTitle)
                    Text("Edges Ignoring Safe Area")
                        .foregroundColor(.white)
                    Text("Ignoring the Safe Areas will extend a view to fill the whole scene.")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                .font(.title)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct ZStack_backgroundColor_Problem: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea(.all)
            VStack {
                VStack(spacing: 20) {
                    Text("ZStack") // This view is under the notch
                        .font(.largeTitle)
                    Text("Edges Ignoring Safe Area")
                    .foregroundColor(.white)
                    Text("Having the ZStack edges ignoring the safe areas might be a mistake if you don't want other layers' edges to also ignore the safe areas. You notice that the top Text view is completely under the notch.")
                    Spacer()
                    // Added a spacer to push the views up.
                }
            }
            .padding()
        }
        .font(.title)
    }
}

struct ZStack_LayerAndAligning: View {
    var body: some View {
        VStack {
            Text("ZStack")
                    .font(.largeTitle)
            Text("Layering & Aligning")
                    .font(.title).foregroundColor(.gray)
            Text("ZStacks are great for layering views. For example, putting text on top of an image.You can align all the subviews within the ZStack.")
                .padding()
                .background(Color.green).font(.title)
            
            ZStack {
                Image("yosemite")
                    .resizable().frame(width: .infinity, height: 200)
                Rectangle()
                    .foregroundColor(.white).opacity(0.5)
                    .frame(width: .infinity, height: 50)
                Text("Yosemite National Park")
                           .font(.title)
                          .padding(8) // Override the default padding with 8 points
            }
        }
    }
}

struct Stacks_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_LayerAndAligning()
    }
}
