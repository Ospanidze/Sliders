//
//  ColorSliderView.swift
//  Sliders
//
//  Created by Айдар Оспанов on 08.08.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack() {
            Text("\(lround(value))")
                .frame(width: 50)
                .foregroundColor(.white)
            Slider(value: $value, in: 1...255, step: 1)
            .tint(color)
            .onChange(of: value) { newValue in
                text = "\(lround(newValue))"
                //text = newValue.formatted() ios 15
            }
            TextFieldView(valueText: $text, valueSlider: $value)
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(12), color: .red)
    }
}
