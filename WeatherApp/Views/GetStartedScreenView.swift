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
            GeometryReader { geo in
                ZStack{
                    BackgroundColor()
                    VStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 300)
                            .padding(.top, 30)
                        
                        Text("Weather")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        
                        
                        
                        Text("ForeCasts")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: 0xDDB130))
                        
                        
                        Spacer()
                        NavigationLink {
                            ContentView()
                                .navigationBarHidden(true)
                        } label: {
                            Button("Get Started") {
                                
                            }
                            .padding(.horizontal, 80)
                            .padding(.vertical, 20)
                            .foregroundColor(Color.black)
                            .background(Capsule().fill(Color.orange))
                            .font(.title2)
                            
                            
                        }
                        Spacer()
                    }
                    
                }
            }.ignoresSafeArea(.all)
            
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
