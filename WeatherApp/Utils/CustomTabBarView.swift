//
//  CustomTabBarView.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    var body: some View {
        HStack {
            ForEach(tabs, id:\.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(BackgroundColor())
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "location", color: Color.blue),
        TabBarItem(iconName: "plus.circle", color: Color.red),
        TabBarItem(iconName: "line.3.horizontal", color: Color.orange)
    ]
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}



extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
        }
        .font(.subheadline)
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 18)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2): Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}

struct TabBarItem: Hashable {
    let iconName: String
    let color: Color
}
