//
//  ContentView.swift
//  Sliders
//
//  Created by Айдар Оспанов on 08.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 1...255)
    @State private var green = Double.random(in: 1...255)
    @State private var blue = Double.random(in: 1...255)
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack() {
            Color.brown
                .ignoresSafeArea()
                .onTapGesture {
//                    UIApplication
//                        .shared
//                        .sendAction(
//                            #selector(UIResponder.resignFirstResponder),
//                            to: nil,
//                            from: nil,
//                            for: nil
//                        )
                    isFocused = false
                }
            
            VStack(spacing: 20) {
                ColorView(red: red, green: green, yellow: blue)
                VStack {
                    ColorSliderView(value: $red, color: .red)
                    ColorSliderView(value: $green, color: .green)
                    ColorSliderView(value: $blue, color: .blue)
                }
                .focused($isFocused)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

