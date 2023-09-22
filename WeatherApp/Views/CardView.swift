//
//  CardView.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 19/09/2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x362A84), Color(hex: 0x8C4BAD)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                HStack {
                    Image("sun")
                    Text("SUNRISE")
                        .font(.title3)
                        .foregroundColor(Color.white)
                }
                
                Text("5:28 AM")
                    .font(.title)
                    .foregroundColor(Color.white)
                
                Spacer().frame(height: 10)
                
                Text("Sunset 5:28 AM")
                    .foregroundColor(Color.white)
                
            }
            .padding()
            
            
        }
        .frame(minWidth: 0, maxWidth: 161, minHeight: 0, maxHeight: 150)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 1)
                .stroke(Color.init(hex: 0xF7CBFD), lineWidth: 1)
        )
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
