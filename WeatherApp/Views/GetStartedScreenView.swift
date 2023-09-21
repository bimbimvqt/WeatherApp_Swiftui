//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 18/09/2023.
//

import SwiftUI

struct GetStartedScreenView: View {
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundColor()
                VStack {
                    Image("logo")
                    
                    Text("Weather")
                        .font(.system(size: 64))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    
                    Text("ForeCasts")
                        .font(.system(size: 64))
                        .fontWeight(.medium)
                        .foregroundColor(Color(hex: 0xDDB130))
                    
                    NavigationLink {
                        ContentView()
                            .navigationBarHidden(true)
                    } label: {
                        Button("Get Started") {
                            
                        }
                        .padding(.horizontal, 100)
                        .padding(.vertical, 20)
                        .foregroundColor(Color.white)
                        .background(Capsule().fill(Color.orange))
                        
                    }
                    Spacer().padding(.bottom, 120)
                }
                
            }
            
        }
    }
    
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct GetStartedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedScreenView()
    }
}
