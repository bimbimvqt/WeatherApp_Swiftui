//
//  Shapes.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 18/09/2023.
//

import SwiftUI

struct CustomRounded: Shape {
    var cornerRadius: CGFloat
      
      func path(in rect: CGRect) -> Path {
          let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
          return Path(path.cgPath)
      }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
