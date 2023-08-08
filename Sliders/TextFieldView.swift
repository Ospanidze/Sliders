//
//  TextFieldView.swift
//  Sliders
//
//  Created by Айдар Оспанов on 08.08.2023.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var valueText: String
    @Binding var valueSlider: Double
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $valueText) { _ in
            withAnimation {
                checkFormat()
            }
        }
            .bordered()
            .onAppear {
                valueText = "\(lround(valueSlider))"
            }
            .alert("Wrong Format", isPresented: $alertPresented, actions: {}) {
                Text("Please, enter correct data")
            }
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50)
            .textFieldStyle(.roundedBorder)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
            )
            .shadow(
                color: .black.opacity(0.5),
                radius: 3, x: 1, y: 2
            )
            .keyboardType(.decimalPad)
    }
}

extension TextField {
    func bordered() -> some View {
        modifier(BorderedViewModifier())
    }
}

extension TextFieldView {
    private func checkFormat() {
        if let value = Double(valueText), (0...255).contains(value) {
            valueSlider = value
            return
        }
        alertPresented.toggle()
        valueSlider = 0
        valueText = "0"
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(valueText: .constant("Aidar"), valueSlider: .constant(12))
    }
}
