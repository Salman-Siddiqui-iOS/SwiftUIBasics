//
//  EnvironmentObjectTest.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 02/02/22.
//

import SwiftUI

/// Why wouldn’t I use Dependency Injection instead?
/// environment value through the initializer vs. defining it through a view modifier.
/// The most significant advantage of using an environment object is making it available to any of the child views if needed. If we were to use dependency injection, we would have had to pass and define the value within each child:Therefore, it can be beneficial to use an environment object instead and make it available to any child views if needed.

final class Theme: ObservableObject {
    @Published var primaryColor: Color = .orange
    
    init(primaryColor: Color) {
        self.primaryColor = primaryColor
    }
}

struct EnvironmentObjectsExampleApp: View {
    
    @State var redTheme = Theme(primaryColor: .red)
    @State var greenTheme = Theme(primaryColor: .green)
    
    var body: some View {
      //  ArticlesListView()
       //     .environmentObject(redTheme)
       //     .environmentObject(greenTheme)
        VStack {
            ArticlesListView()
               // .environmentObject(redTheme)
        }
        .environmentObject(greenTheme)
    }
}

struct ArticlesListView: View {
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(theme.primaryColor)
            
    }
}
 

struct EnvironmentObjectTest_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectsExampleApp().environmentObject(Theme(primaryColor: .orange))
    }
}
