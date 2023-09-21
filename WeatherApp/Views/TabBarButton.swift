//
//  TabBarButton.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 19/09/2023.
//

import SwiftUI

struct TabBarButton: View {
    
    var imageName: String
    
    
    var body: some View {
        GeometryReader {geo in
            VStack {
                Image(systemName: imageName).resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(imageName: "plus.circle")
    }
}
