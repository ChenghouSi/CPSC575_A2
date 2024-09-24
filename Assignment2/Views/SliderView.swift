//
//  SliderView.swift
//  Assignment2
//
//  Created by Chenghou Si on 2024-09-25.
//

import SwiftUI

struct SliderView: View {
    @State private var num: Double = 50
    
    let space: CGFloat

    var body: some View {
        VStack(spacing: space) {
            Text("\(num, specifier: "%.0f")")
            
            Slider(value: $num, in: 0...100, step: 1)
                .frame(width: UIScreen.main.bounds.size.width / 2)
        }
    }
}

#Preview {
    SliderView(space: 20)
}
