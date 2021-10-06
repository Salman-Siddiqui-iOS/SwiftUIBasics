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


struct ViewBuildersTest_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuildersTest()
    }
}
