//
//  ColorView.swift
//  Sliders
//
//  Created by Айдар Оспанов on 08.08.2023.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let yellow: Double
    
    var body: some View {
        Rectangle()
            .foregroundColor(
                Color(
                    red: red / 255,
                    green: green / 255,
                    blue: yellow / 255)
            )
            .frame(height: 150)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}
struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 123, green: 255, yellow: 211)
    }
}
