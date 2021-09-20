//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 19/06/21.
//

import SwiftUI

class User: ObservableObject {
    @Published var score = 0
}

struct ChangeView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            Text("Score: \(user.score)")
            Button("Increase") {
                user.score += 1
            }
        }
    }
}

struct NavigationBarButtonView: View {
    @State private var score = 0
    
    var body: some View {
        Text("Bar Button Score:\(score)")
            .navigationBarItems( trailing:
                                    HStack {
                Button("Add 1") {
                    score += 1
                }
                Button("Subtract 1") {
                    score -= 1
                }
            })
    }
}

struct NavigationContentView: View {
    
    @State private var isShowingDetailView: Bool = false
    
    @State private var selection: String?
    
    @ObservedObject var user: User = User()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationBarButtonView()
                // NavigationLink action
                NavigationLink(destination: Text("Hello")) {
                    Text("Click")
                }
                // Button link action
                NavigationLink(destination: Text("Detail"), isActive:  $isShowingDetailView) {
                     EmptyView()
                }
                Button("Tap to show Detail") {
                    isShowingDetailView = true
                }
                
                // Tag when multiple links
                
                NavigationLink(destination: Text("First Tag View"), tag: "First",
                    selection: $selection) {
                    EmptyView()
                }
                NavigationLink(destination: Text("Second Tag View"), tag: "Second", selection: $selection) {
                    EmptyView().background(Color.red)
                }
                Button("Tap to show First tag View") {
                    selection = "First"
                }
                Button("Tap to show Second tag View") {
                    selection = "Second"
                }
                
                // Environment Test
                Text("Score:\(user.score)")
                NavigationLink(destination: ChangeView()) {
                    Text("Show Environment View")
                }
            }
            .navigationBarTitle("Navigation")
        }
        .environmentObject(user)
    }
}

struct NavigationContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContentView()
    }
}
