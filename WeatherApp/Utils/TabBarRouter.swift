//
//  TabBarRouter.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//

import SwiftUI
import Foundation

class TabBarRouter: ObservableObject {
    @Published var currentPage: Page = .home
    
}


enum Page {
    case home
    case map
    case video
}
