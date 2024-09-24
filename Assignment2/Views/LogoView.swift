//
//  Logo.swift
//  Assignment2
//
//  Created by Chenghou Si on 2024-09-24.
//

import SwiftUI

struct LogoView: View {
    let height: CGFloat

    var body: some View {
        Image(.lindsayLogoUpper)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: height)
    }
}

#Preview {
    LogoView(height: 200)
}
