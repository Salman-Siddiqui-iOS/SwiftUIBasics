//
//  Forms.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 23/09/21.
//

import SwiftUI

// The Form view is a great choice when you want to show settings, options, or get some user input. It is easy to set up and customize as you will see on the following pages.
// This is a push-out view.

struct Form_Intro: View {
    var body: some View {
        Form {
            Section {
            Text("This is a Form!")
            .font(.title)
            Text("You can put any content in here")
            Text("The cells with grow to fit the content")
            Text("Remember, it's just views inside of views")
            }
            
            Section {
                Text("Limitations")
                .font(.title)
                Text("There are built-in margins that are difficult to get around. Take a look at the color below so you can see where the margins are:")
                Color.purple
            }
            
            Section {
                Text("Summary")
                    .font(.title)
                Text("Pretty much what you see here is what you get.")
            }
        }
    }
}

struct Form_HeadersAndFooters: View {
    var body: some View {
        Form {
            Section(header: Text("Section Header Text")) {
                Text("You can add any view in a section header")
                Text("Notice the default foreground color is gray")
            }
            
            Section(header: SectionTextAndImage(name: "People", image: "person.2.square.stack.fill")) {
                Text("Here's an example of a section header with image and text")
            }
            
            Section(header: Text(""), footer: Text("Total: $5,600.00").bold()) {
                Text("Here is an example of a section footer")
            }
        }
    }
}

struct SectionTextAndImage: View {
    var name: String
    var image: String
    var body: some View {
    HStack {
        Image(systemName: image).padding(.trailing)
        Text(name)
    }
    .padding()
    .font(.title)
    .foregroundColor(Color.purple)
    }
}

struct Form_List_RowBackground: View {
    var body: some View {
        Form {
            Section(header: Text("Form").font(.largeTitle)) {
                Text("List Row Background")
                    .foregroundColor(.gray)
                Text("Forms and Lists allow you to set a background view with a function called\"listRowBackground(view:)\".").fixedSize(horizontal: false, vertical: false)
                // Using fixedSize is another way to get text not to truncate.
                // See chapter on "Layout Modifiers" in full book.
                Text("You can call this modifier function on just one row, like this.")
                    .listRowBackground(Color.purple)
                    .foregroundColor(.white)
                Section(header: Text("Whole Section")
                .font(.title).foregroundColor(.gray)) {
                    Text("Or you can set a view or color for a whole section.")
                    Image(systemName: "smiley.fill")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.largeTitle)
                    Text("Note, even though the color is set on the Section, the color of the section header is not affected.")
                    .fixedSize(horizontal: false, vertical: true)
                }.foregroundColor(Color.white)
                    .listRowBackground(Color.green)
            }
            .font(.title)
        }
    }
}

struct Form_ListRowInset: View {
    var body: some View {
        Form {
            Section(header: Text("Form").font(.largeTitle)) {
                Text("Using this color, you can see where the default margins are:")
                Color.purple
                Text("You can use the List Row Inset modifier to adjust the margins:")
                Color.purple.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            Section(header: Text("Row Inset Users").font(.largeTitle).foregroundColor(.green)) {
                Text("Other possible uses could be for indenting")
                Text("Indent Level 1").listRowInsets(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                Text("Indent Level 2").listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                Text("Indent Level 3").listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                Text("Indent Level 4").listRowInsets(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 20))
            }
        }
    }
}

struct Forms_Previews: PreviewProvider {
    static var previews: some View {
        Form_ListRowInset()
    }
}
