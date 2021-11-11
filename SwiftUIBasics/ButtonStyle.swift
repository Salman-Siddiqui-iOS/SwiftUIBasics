//
//  ButtonStyle.swift
//  SwiftUIBasics
//
//  Created by APPLE on 24/10/21.
//

import SwiftUI

    struct ButtonBasic: View {
        
        @State private var isLoading = false
        
        var body: some View {
            VStack {
                
                Button("Button 1") {}
                .buttonStyle(FilledButton())
                
                Button("Button 2") { }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                
                Button("Download") {
                    isLoading.toggle()
                }
                .buttonStyle(ProgressButtonStyle(isLoading: isLoading))
                
                if #available(iOS 15.0, *)
                    {
                        Button("Delete", role: .destructive) { }
                            
                } else {
                    Text("Hello World")
                }
                
            }
        }
    }

    /// *ButtonStyle protocol
    ///
    ///  SwiftUI allows us to customize buttons in our apps without introducing new views
    struct FilledButton: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled
     ///  `ButtonStyle` protocol has the only one requirement. We need to implement makeBody function
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(isEnabled ? Color.accentColor : .gray)
            .cornerRadius(8)
    }
}

struct OutlineButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .red : .green)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.blue))
    }
}

struct RootView: View {
   @State private var isClicked: Bool  = false
    var body: some View {
        HStack(spacing: 16) {
            Button("Press long") {
                self.isClicked.toggle()
            }
            .buttonStyle(LongPressButton())
            .padding()
            .background(isClicked ? Color.red : Color.green)
            .cornerRadius(8)
            
            Button("Button 2") {}
            .buttonStyle(OutlineButton())
            
        }
    }
}

    /// *Custom behavior* with button styles

    struct ProgressButtonStyle: ButtonStyle {
        let isLoading: Bool
        
        func makeBody(configuration: Configuration) -> some View {
            if #available(iOS 15.0, *) {
                configuration.label.opacity(isLoading ? 0 : 1)
                    .overlay {
                        if isLoading {
                            ProgressView()
                        }
                    }
            } else {
                // Fallback on earlier versions
            }
        }
    }

    struct ToolBarButton: View {
        var body: some View {
            NavigationView {
                Text("Hello, World!")
                    .toolbar {
                        Menu("Action") {
                            Button("New Action") {}
                            if #available(iOS 15.0, *) {
                                Button("Delete", role: .destructive) {}
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }
            }
        }
    }

    /// *PrimitiveButtonStyle protocol
    ///
    /// we need a button that acts only after a `long press`.
    /// We can’t achieve that with ButtonStyle protocol because it doesn’t provide us control on `triggering` the `button action`.

    struct LongPressButton: PrimitiveButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label.gesture(LongPressGesture()
                .onEnded { _ in
                    configuration.trigger()
                })
        }
    }

    // MARK: - Button Styles
    
    @available(iOS 15.0, *)
    struct Button_Style: View {
        var body: some View {
            VStack {
                Button {
                    
                } label: {
                    Label("Learn More", systemImage: "book.fill")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .foregroundColor(.pink)
            }
        }
    }

    @available(iOS 15.0, *)
    struct ButtonStyle_Previews: PreviewProvider {
        static var previews: some View {
            Button_Style()
        }
    }
