//
//  HomeScreenView.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 18/09/2023.
//

import SwiftUI

struct HomeScreenView: View {
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundColor()
                
                ScrollView {
                    VStack {
                        
                        Image("sub_logo")
                        
                        sumaryView
                        
                        maxmin
                        
                        Image("house").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 336, height: 198, alignment: .center)
                        
                        weatherDay
                        
                        Spacer()
                        
                    }
                }
                
            }
           
        }
        
    }
    
    var sumaryView: some View {
        VStack{
            Text("19°")
                .font(.system(size: 44))
                .foregroundColor(Color.white)
                .fontWeight(.medium)
            Text("Precipitations")
                .foregroundColor(Color.white)
                .font(.system(size: 24))
        }
        
    }
    
}

var weatherDay: some View {
    
    ZStack {
        LinearGradient(gradient: Gradient(colors: [Color(hex: 0x362A84), Color(hex: 0x8C4BAD)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        VStack {
            HStack {
                Text("Today")
                    .foregroundColor(Color.white)
                Spacer()
                Text("July, 21")                .foregroundColor(Color.white)
                
            }.padding(.horizontal, 50.0)
            Divider().background(Color.white)
            HStack {
                WeatherInfo(temp: 19, imageName: "logo", num: 15)
                WeatherInfo(temp: 18, imageName: "logo", num: 16)
                WeatherInfo(temp: 19, imageName: "logo", num: 12)
                WeatherInfo(temp: 19, imageName: "logo", num: 25)
            }
        }.padding()
        
    }
    .clipShape(RoundedCorner(radius: 30, corners: [.topLeft, .topRight]))
    
}


var maxmin: some View {
    HStack {
        Text("Max: 24°")
            .foregroundColor(Color.white)
            .font(.system(size: 24))
        Text("Min: 18°")
            .foregroundColor(Color.white)
            .font(.system(size: 24))
    }
    
}



struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

struct WeatherInfo: View {
    var temp: Int
    var imageName: String
    var num: Int
    var body: some View {
        VStack {
            Text("\(temp)")
                .foregroundColor(Color.white)
            Image(imageName).resizable().frame(width: 66.0, height: 66.0)
            Text("\(num)°")
                .foregroundColor(Color.white)
        }
    }
}

