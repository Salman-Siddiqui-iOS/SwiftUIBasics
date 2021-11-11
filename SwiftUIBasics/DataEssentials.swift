//
//  DataEssentials.swift
//  SwiftUIBasics
//
//  Created by salman siddiqui on 08/11/21.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var value: Int = 0
}

struct CounterView: View {
    @StateObject var counter: Counter
    
    var body: some View {
        VStack {
            Text("\(counter.value)")
            Button("Counter Value Increment") {
                counter.value += 1
            }
        }
    }
}

struct CounterView_2: View {
    @StateObject var counter: Counter
    
    var body: some View {
        VStack {
            Text("\(counter.value)")
            Button("Counter 2 Value Increment") {
                counter.value += 1
            }
            CounterView_2Binding(value: $counter.value)
        }
    }
}

struct CounterView_2Binding: View {
    @Binding var value: Int
    
    var body: some View {
        VStack {
        Text("Counter 2 Binding :\(value)")
        Button("Counter 2Binding Value Increment") {
            value += 1
            }
        }
    }
}

struct DataEssentials: View {
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            CounterView(counter: Counter())
            CounterView_2(counter: Counter())
            Text("\(count)")
            Button("Context View Counter Value Increment") {
                count += 1
            }
        }
        .padding()
        .background(Color.yellow)
    }
}

struct DataEssentials_Previews: PreviewProvider {
    static var previews: some View {
        DataEssentials()
    }
}
