//
//  CustomColor.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 20/09/2023.
//

import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(hex: 0x362A84), Color(hex: 0x8C4BAD)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
