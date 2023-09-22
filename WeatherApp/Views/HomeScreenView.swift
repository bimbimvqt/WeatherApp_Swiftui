//
//  HomeScreenView.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 18/09/2023.
//

import SwiftUI

struct HomeScreenView: View {
    
    
    let currentDateTime = Date()
      
      static let stackDateFormat: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateFormat = "MM, dd"
          return formatter
      }()
    
    @StateObject private var viewModel = WeatherViewModel(weatherService: WeatherService())
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundColor()
                
                ScrollView {
                    VStack(spacing: 0) {
                        
                        Image(viewModel.weatherIcon)
                            .resizable()
                            .frame(minWidth: 0, maxWidth: geo.size.width * 0.5)
                            .frame(minHeight: 0, maxHeight: geo.size.height * 0.3)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        
                        sumaryView
                        
                        maxmin
                        
                        Image("house").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: geo.size.width)
                            .frame(minHeight: 0, maxHeight: geo.size.height)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                            
                        
                        weatherDay
                        
                        Spacer()
                        
                    }
                }
                
            }
           
        }.onAppear{
            viewModel.refresh()
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
                    Text(currentDateTime, format: Date.FormatStyle().month().day())                .foregroundColor(Color.white)
                    
                }.padding(.horizontal, 50.0)
                Divider().background(Color.white)
                HStack {
                    WeatherInfo(temp: viewModel.temperature, imageName: viewModel.weatherIcon, num: viewModel.temperature)
                    WeatherInfo(temp: viewModel.temperature, imageName: viewModel.weatherIcon, num: viewModel.temperature)
                    WeatherInfo(temp: viewModel.temperature, imageName: viewModel.weatherIcon, num: viewModel.temperature)
                    WeatherInfo(temp: viewModel.temperature, imageName: viewModel.weatherIcon, num: viewModel.temperature)
                }
            }.padding()
            
        }
        .padding(.bottom, 30)
        .clipShape(RoundedCorner(radius: 30, corners: [.topLeft, .topRight]))
        
    }
   
    
    var maxmin: some View {
        HStack {
            Text("Max: \(Int(viewModel.tempMax))°C")
                .foregroundColor(Color.white)
                .font(.title2)
            Text("Min: \(Int(viewModel.tempMax))°C")
                .foregroundColor(Color.white)
                .font(.title2)
        }
        
    }

    
    var sumaryView: some View {
        VStack{
            Text(viewModel.temperature)
                .font(.title2)
                .foregroundColor(Color.white)
                .fontWeight(.medium)
            Text(viewModel.weatherDescription)
                .foregroundColor(Color.white)
                .font(.title3)
        }
        
    }
    
}






struct WeatherInfo: View {

    var temp: String
    var imageName: String
    var num: String
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






struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
