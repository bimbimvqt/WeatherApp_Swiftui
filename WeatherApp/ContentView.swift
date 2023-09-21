//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 19/09/2023.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    

        
    @StateObject var tabbarRouter = TabBarRouter()
    
    @ViewBuilder var contentView: some View {
        switch tabbarRouter.currentPage {
            case .home:
                HomeScreenView()
            case .map:
                HomeScreenView()
            case .video:
                WeatherScreenView()
        }
    }
    
    @State private var selection: String = "location"
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                // Contents
                
                    contentView


                Spacer()
                // Tabbar
                HStack {
                    HStack {
                        TabItems(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "location", tabName: "Home", tabbarRouter: tabbarRouter,assignedPage: .home)
                        
                        TabItems(width: geometry.size.width/5, height: geometry.size.height/30, systemIconName: "plus.circle", tabName: "Map", tabbarRouter: tabbarRouter,assignedPage: .map)
                        
                        TabItems(width: geometry.size.width/5, height: geometry.size.height/48, systemIconName: "line.3.horizontal", tabName: "Profile", tabbarRouter: tabbarRouter,assignedPage: .video)
                            .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 10, trailing: 0))
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height/10)
                .background(BackgroundColor().shadow(radius: 2).frame(height: 100))
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
   

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}
