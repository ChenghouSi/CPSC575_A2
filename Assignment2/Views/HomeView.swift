//
//  HomeView.swift
//  Assignment2
//
//  Created by Chenghou Si on 2024-09-24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            LogoView(height: 200)
                .padding(.bottom)
            
            InfoView(space: 25)
            
            SliderView(space: 25)
                .padding(.bottom)
            
            SwitchView(pickerHeight: 40, pickerPadding: 100)
            
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    HomeView()
}
