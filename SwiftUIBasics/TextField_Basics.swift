//
//  TextField_Basics.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 02/11/21.
//

import SwiftUI

struct TextField_Basics: View {
    
    @State private var userName: String = "Salman"
    
    var body: some View {
        VStack(spacing: 10) {
        Text(userName)
             /// `onEditingChanged` This is similar to func `textFieldDidBeginEditing(UITextField)` and func `textFieldDidEndEditing(UITextField)` in UITextFieldDelegate.
            ///
            /// `onCommit:` `TextField` calls `onCommit` closure when the user presses the Return key.
            TextField("User Name", text: $userName, onEditingChanged: { isBegin in
                if isBegin {
                    print("Begins editing")
                } else {
                    print("Finishes editing")
                }
            }, onCommit: {
                print("commit")
            })
            .padding()
            
            Button("AutoFill") {
                userName = "Hello Salman"
            }
        }
     }
}

struct TexField_Style: View {
    @State private var userName = ""
    @State private var fullName = ""
    
    
    var body: some View {
        VStack(spacing: 20) {
            if #available(iOS 15.0, *) {
                TextField("User Name", text: $userName)
                    .textFieldStyle(.roundedBorder)
            } else {
                // Fallback on earlier versions
            }
            if #available(iOS 15.0, *) {
                TextField("Full Name", text: $fullName)
                    .textFieldStyle(.roundedBorder)
            } else {
                // Fallback on earlier versions
            }
        }
        .padding()
    }
}

struct TextField_Basics_Previews: PreviewProvider {
    static var previews: some View {
        TexField_Style()
    }
}
