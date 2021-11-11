//
//  NavigationContentView2.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 07/10/21.
//

import SwiftUI

enum CardSuit: String, CaseIterable {
    case diamonds
    case clubs
    case hearts
    case spades
}

class NavModel: ObservableObject {
    @Published var activeSuit: CardSuit? {
        didSet {
            print("activeSuit: ", String(describing: self.activeSuit))
        }
    }
    
    @Published var showDetails = false {
        didSet {
                    print("showDetails: ", self.showDetails)
        }
    }
}

struct NavigationContentView2: View {
    
    @EnvironmentObject var navModel: NavModel
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                List(CardSuit.allCases, id: \.self) { card in
                    //  having multiple Booleans to track different possible navigation destinations would be difficult, so SwiftUI gives us an alternative: we can add a tag to each navigation link
                    
                    //  then control which one is triggered using a single property.
                    // which will activate the NavigationLink when the tag value matches the selection value:
                    NavigationLink(tag: card, selection: $navModel.activeSuit) {
                        MainView(card: card)
                    } label: {
                        Text(card.rawValue)
                    }
                }
                .navigationTitle("Hello")
            }
            .environmentObject(navModel)
            .navigationViewStyle(.stack)
        } else {
            // Fallback on earlier versions
        }
    }
}


@available(iOS 15.0, *)
struct MainView: View {
    @EnvironmentObject var navModel: NavModel
    
    @Environment(\.dismiss) private var dismiss
    let card: CardSuit
    
    var body: some View {
        VStack(spacing: 20) {
            Text(card.rawValue)
            Button("Dismiss by Environment") {
                dismiss()
            }
            NavigationLink(isActive: $navModel.showDetails) {
                DetailView(card: card)
            } label: {
                Text("Show more details")
            }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var navModel: NavModel
    let card: CardSuit
    
    @State private var openSheet: Bool = false
    
    @State private var showOverlay: Bool = false
    
    var body: some View {
        ZStack {
        VStack(spacing: 20) {
            Text("More details about \(card.rawValue)")
            Button("Go back to suit") {
                navModel.showDetails = false
            }
            
            Button("Open Sheet") {
                openSheet.toggle()
            }
            .sheet(isPresented: $openSheet) {
                print("On Dismiss")
            } content: {
                if #available(iOS 15.0, *) {
                    SheetView(showOverlay: $showOverlay)
                } else {
                    // Fallback on earlier versions
                }
            }

//            Button("Show Overlay") {
//                showOverlay.toggle()
//            }
//            .fullScreenCover(isPresented: $showOverlay) {
//                print("On dimsiss")
//            } content: {
//                if #available(iOS 15.0, *) {
//                    SheetView(showOverlay: $showOverlay)
//                } else {
//                    // Fallback on earlier versions
//                }
//            }
            
            Button("Show Overlay") {
                showOverlay.toggle()
            }

            Button("Go back to suit menu") {
                navModel.activeSuit = nil
            }
        }
        if showOverlay {
            if #available(iOS 15.0, *) {
                SheetView(showOverlay: $showOverlay)
                    .zIndex(1)
            } else {
                // Fallback on earlier versions
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct SheetView: View {
    @Binding var showOverlay: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
         Color(.systemBackground).opacity(showOverlay ? 0.4 : 1)
                
        RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground))
            .padding()
            .frame(width: 250, height: 450)
            .shadow(color: .black.opacity(0.4), radius: 2, x: 2, y: 2)
        }
        
        .overlay(Text("Hello Overlay"))
        .onTapGesture {
            if showOverlay {
                withAnimation {
                    showOverlay.toggle()
                }
            } else {
                dismiss()
            }
        }
    }
}

struct NavigationContentView2_Previews: PreviewProvider {
    static var previews: some View {
        let navObj = NavModel()
        NavigationContentView2()
            .environmentObject(navObj)
    }
}
