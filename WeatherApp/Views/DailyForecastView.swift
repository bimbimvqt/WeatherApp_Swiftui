//
//  DailyForecastView.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 19/09/2023.
//

import SwiftUI


struct DailyForecastView: View {
    
    
    let tmp: String
    let imageLink: String
    let days: String
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0x3E2D8F), Color(hex: 0x9D52AC)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack {
                    Text("\(tmp)")
                        .foregroundColor(Color.white)
                    Image(imageLink).resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 66, height: 66)
                    Text(days)
                        .foregroundColor(Color.white)
                }
                    
            }
           
        .cornerRadius(42)
        } .frame(width: 62, height: 162)
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(tmp: "19", imageLink: "logo", days: "MON")
    }
}
