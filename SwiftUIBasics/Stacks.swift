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


struct Stacks_Previews: PreviewProvider {
    static var previews: some View {
        VStackContainer()
    }
}
