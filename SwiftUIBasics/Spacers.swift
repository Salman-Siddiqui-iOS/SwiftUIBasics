//
//  Spacers.swift
//  SwiftUIBigMountain
//
//  Created by salman siddiqui on 22/09/21.
//

import SwiftUI
// You may notice that when you add new pull-in views, such as Text views, they appear in the center of the screen. You can use the Spacer to push these views apart, away from the center of the screen.

struct Spacers: View {
    var body: some View {
        VStack {
            Text("Spacer")
                .font(.largeTitle)
            Text("Introduction")
            Text("Spacers push things away either vertically or horizontally")
            Image(systemName: "arrow.up.circle.fill")
            Spacer()
            Image(systemName: "arrow.down.circle.fill")
            HStack {
                Text("Horizontal Spacer")
                Image(systemName: "arrow.left.circle.fill")
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
            }
            .padding()
            Color.yellow
                .frame(height: 50)
            // Height can decrease but not go higher than 50
        }
        .font(.title)
    }
}

// MARK: - Evenly Spaced
struct EvenlySpaced: View {
    fileprivate func beforeNames() -> some View {
     HStack {
         Spacer()
            VStack {
                Text("Names")
                    .font(.largeTitle)
                    .underline()
                Text("Salman")
                Text("Hafsa")
                Text("Hello")
            }
            Spacer()
            VStack {
                Text("Colors")
                    .font(.largeTitle)
                    .underline()
                Text("Red")
                Text("Orange")
                Text("Green")
            }
         Spacer()
        }
    }
    
    var body: some View {
        VStack {
        Text("Spacer")
                .font(.title)
        Text("Evenly Spaced")
                .font(.title)
                .foregroundColor(.gray)
        Text("Use Spacer to evenly space views horizontally so they look good on any device.")
            .padding()
            .foregroundColor(.black)
            .background(Color.yellow)
            Text("Before")
                .font(.title)
            beforeNames()
        }
    }
}

// MARK: - Minium Spacer
struct MinimumLenght: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Spacer")
                .font(.largeTitle)
            Text("Minimum Length")
                .font(.title)
            Text("You can set a minimum space to exist between views using the minLength modifier on the Spacer.")
                .padding()
                .background(Color.yellow)
            Text("No minLength set (system default is used)")
                    .bold()
            HStack {
                Image("yosemite")
                    .resizable()
                    .frame(width: 200, height: 100)
                Spacer()
                Text("This is Yosemite National Park").lineLimit(1)
            }
            .padding()
            Text("minLength = 0")
                    .bold()
            HStack {
                Image("yosemite")
                    .resizable()
                    .frame(width: 200, height: 100)
                Spacer(minLength: 0)
                Text("This is Yosemite National Park").lineLimit(1)
            }
            .padding()
            Text("minLength = 20")
                    .bold()
            HStack {
                Image("yosemite")
                    .resizable()
                    .frame(width: 200, height: 100)
                   Spacer(minLength: 20)
                   Text("This is Yosemite National Park").lineLimit(1)
               }.padding()
        }
    }
}

struct Spacers_Previews: PreviewProvider {
    static var previews: some View {
        MinimumLenght()
    }
}
