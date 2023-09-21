//
//  TabItems.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//

import SwiftUI

struct TabItems: View {
    
    @ViewBuilder
    var contentVeiew : some View {
        switch tabbarRouter.currentPage {
            case .home:
                GetStartedScreenView()
            case .map:
                HomeScreenView()
            case .video:
                WeatherScreenView()
        }
    }
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    @ObservedObject var tabbarRouter: TabBarRouter
    let assignedPage: Page
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
                .foregroundColor(tabbarRouter.currentPage == assignedPage ? Color.white : Color.purple)
            
            Spacer().frame(height: 15)
        }
        .onTapGesture {
            tabbarRouter.currentPage = assignedPage
        }
        .padding(.horizontal,20)
    }
}



