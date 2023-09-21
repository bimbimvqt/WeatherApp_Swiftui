//
//  CustomTabBar.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 19/09/2023.
//

import SwiftUI

enum Tabs: Int {
    case loca = 0
    case plus = 1
    case menu = 2
}


struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    var body: some View {
        HStack {
            Button {
                selectedTab = .loca
            } label: {
                TabBarButton(imageName: "plus.circle")
                
//                GeometryReader {geo in
//                    VStack {
//                        Image(systemName: "location").resizable()
//                            .scaledToFit()
//                            .frame(width: 20, height: 20)
//
//                    }
//                    .frame(width: geo.size.width, height: geo.size.height)
//                }
              
                .tint(Color.init(hex: 0x000000))
            }
            Button {
                selectedTab = .plus
            } label: {
                TabBarButton(imageName: "plus.circle")
                .tint(Color.init(hex: 0x000000))
            }
            
            Button {
                selectedTab = .menu
            } label: {
                TabBarButton(imageName: "plus.circle")
                .tint(Color.init(hex: 0x000000))
            }
        }.frame(height: 82)
        
        }
    }


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.loca))
    }
}
