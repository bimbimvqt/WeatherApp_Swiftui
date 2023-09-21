import SwiftUI

struct WeatherScreenView: View {
    @State private var currentIndex = 0
    private func scrollToOffset(_ offset: CGFloat, _ proxy: ScrollViewProxy) {
           withAnimation {
               proxy.scrollTo(offset, anchor: .trailing)
           }
       }
    @State private var xOffset: CGFloat = 1
    
    private let minOffset: CGFloat = 0
    private let maxOffset: CGFloat = 120
    var body: some View {
        
        
        
        GeometryReader { geo in
            ZStack {
                
                BackgroundColor()
                
                ScrollView {
                    VStack(spacing: 0.0) {
                        Spacer().frame(height: 30)
                        Text("North America")
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .padding()
                        
                        
                        HStack(spacing: 20) {
                            Text("Max: 24°C")
                                .font(.title2)
                                .foregroundColor(Color.white)
                            
                            Text("Max: 24°C")
                                .font(.title2)
                                .foregroundColor(Color.white)
                        }
                        
                        
                        Text("7-Days Forecasts")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        VStack {
                            
                            
                            ScrollViewReader { scrollViewProxy in
                                HStack {
                                    Button {
                                        if xOffset < minOffset {
                                            xOffset += 50
                                            scrollToOffset(xOffset, scrollViewProxy)
                                        }
                                    } label: {
                                        Image("arrow_left")
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 25) {
                                            ForEach(0..<5) { index in
                                                DailyForecastView(tmp: "19", imageLink: "logo", days: "MON")
                                            }
                                            .offset(x: xOffset)
                                        }
                                        .padding()
                                    }
                                    .offset(x: 5)
                                    
                                    Button {
                                        if xOffset > minOffset {
                                            xOffset -= 70
                                            scrollToOffset(xOffset, scrollViewProxy)
                                        }
                                        
                                    } label: {
                                        Image("arrow_right")
                                            .foregroundColor(Color.white)
                                        
                                    }
                                    
                                }
                                .padding()
                            }
                        }
                        
                        SeeMoreCard
                        
                        VStack {
                            HStack{
                                CardView()
                                CardView()
                                
                            }.padding()
                            Spacer()
                        }
                        
                        
                        Spacer()
                    }
                }
                
            }
        }.ignoresSafeArea(.all)
        
    }
}

var SeeMoreCard: some View {
    ZStack{
        LinearGradient(gradient: Gradient(colors: [Color(hex: 0x362A84), Color(hex: 0x8C4BAD)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        VStack {
            HStack() {
                Image("cross_hair")
                Text("AIR QUALITY")
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding()
            
            VStack {
                Text("3-Low Health Risk")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .font(.title)
                
                Divider().background(Color.white)
                    .padding(.horizontal)
            }
            
            
            HStack {
                Text("See more")
                    .font(.title2)
                    .foregroundColor(Color.white)
                Spacer()
                Image("arrow_right")
            }
            .padding()
            
            Spacer()
        }
        
    }
    .cornerRadius(20)
    .frame(height: 174)
    .padding(.horizontal, 10)
    .padding()
}

var DailyForecast: some View {
    
    
    ScrollViewReader { scrollViewProxy in
        HStack {
            
            Button {
                
            } label: {
                Image("arrow_left")
                    .foregroundColor(Color.white)
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(0..<5) { index in
                        DailyForecastView(tmp: "19", imageLink: "logo", days: "MON").id(index)
                    }
                }
                .padding()
            }
            
            Button {
                
            } label: {
                Image("arrow_right")
                    .foregroundColor(Color.white)
                
            }
        }
        
        
        
    }
    
}


struct WeatherScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherScreenView()
        }
    }
}
