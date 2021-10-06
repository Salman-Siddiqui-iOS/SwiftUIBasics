//
//  Clipping.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 05/10/21.
//

import SwiftUI

struct Clipping: View {
    var body: some View {
        /**
         - Every view comes with a bound and frame.
         
         - The red border shows the content frame,
         */
        VStack(spacing: 20) {
        Text("SALMAN")
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.largeTitle)
            .border(Color.red)
            
            // The red border shows the content frame,
            // - frame is used for composing the overall view hierarchy layout - the view content can exceed its bound frame (also known as bleeding).
             // As SwiftUI allows content bleeding by default
            
            Text("SIDDIQUI")
                .background(Color.yellow)
                .font(.system(size: 90))
                .fixedSize()
                .border(Color.blue)
                .frame(width: 200, height: 200)
                .border(.red)
            // the content is drawn even when it extends beyond the view frame edges. To avoid this, we can use clipping:
            // The clipped() view modifier limits the drawing of a view to its bound frame, everything else will be hidden.
            Text("HAFSA")
                .background(Color.yellow)
                .font(.system(size: 90))
                .fixedSize()
                .border(Color.blue)
                .frame(width: 200, height: 200)
                .border(.red)
                .clipped()
            // SwiftUI comes with two clipped() alternatives: cornerRadius(_:) and clipShape(_:style).
            Text("HAFSA")
                .background(Color.yellow)
                .font(.system(size: 90))
                .fixedSize()
                .border(Color.blue)
                .frame(width: 200, height: 200)
                .border(.red)
                .cornerRadius(0)
            Text("STAR")
                .background(Color.yellow)
                .frame(width: 40, height: 40)
                .fixedSize()
                .border(Color.red)
                .clipShape(Circle())
        }
    }
}

struct Clipping_Previews: PreviewProvider {
    static var previews: some View {
        Clipping()
    }
}
