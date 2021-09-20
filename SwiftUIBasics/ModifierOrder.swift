//
//  ContentView.swift
//  SwiftUiModifierOrder
//
//  Created by APPLE on 17/03/21.
//

import SwiftUI


struct VerifiedLabel: View {
    var body: some View {
        Label("Verified", systemImage: "checkmark.seal.fill")
            .foregroundColor(.white)
            .font(.callout)
            .padding()
            .border(Color.red)
            .background(Color.green)
        
        Text("Verified")
                    .foregroundColor(.white)
                    .font(.callout)
                    .bold()
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
    }
    /// Since none of the modifiers that we use above affect the layout or position of our view, but rather just modify its own internal appearance and the environment in which it will be rendered, we can change the order of them as much as we want, and we’ll still get the exact same result.
}

struct ModifierOrder: View {
    var body: some View {
        VerifiedLabel()
    }
}

struct ModifierOrder_Previews: PreviewProvider {
    static var previews: some View {
        ModifierOrder()
    }
}
