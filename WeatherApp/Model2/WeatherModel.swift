//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//

import Foundation


struct Weather: Identifiable {
    let id = UUID()
    
    let temperature: Int
    let weatherCode: WeatherCode

}

struct WeatherModel: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let timelines: [WeatherTimelines]
}

struct WeatherTimelines: Codable {
    let intervals: [WeatherIntervals]
}

struct WeatherIntervals: Codable {
    let startTime: String
    let values: WeatherValue
}

struct WeatherValue: Codable {
    var temperature: Double
    var weatherCode: Int
}

enum WeatherCode: String, Codable {
    case clear = "1000"
    case mostlyClear = "1100"
    case partlyCloudy = "1101"
    case mostlyCloudy = "1102"
    case cloudy = "1001"
    case fog = "2000"
    case lightFog = "2100"
    case lightWind = "3000"
    case wind = "3001"
    case strongWind = "3002"
    case drizzle = "4000"
    case rain = "4001"
    case lightRain = "4200"
    case heavyRain = "4201"
    case snow = "5000"
    case flurries = "5001"
    case lightSnow = "5100"
    case heavySnow = "5101"
    case freezingDrizzle = "6000"
    case freezingRain = "6001"
    case lightFreezingRain = "6200"
    case heavyFreezingRain = "6201"
    case icePellets = "7000"
    case heavyIcePellets = "7101"
    case lightIcePellets = "7102"
    case thunderstorm = "8000"
    
    var description: String {
        switch self {
        case .clear:
            return "It's very sunny!\n Don't forget your hat!"
        case .cloudy, .mostlyCloudy:
            return "Cloudy today!\n Watch out for some rain"
        case .mostlyClear, .partlyCloudy:
            return "Enjoy your day!"
        case .fog, .lightFog:
            return "Drive safe and make sure to turn on your low-beam headlights!"
        case .lightWind:
            return "Enjoy some light breeze today!"
        case .wind, .strongWind:
            return "Very windy today!"
        case .drizzle, .lightRain:
            return "A bit of rain,\n don't forget your umbrella!"
        case .rain, .heavyRain:
            return "Rainy today,\n don't forget your umbrella!"
        case .snow, .flurries, .lightSnow, .heavySnow:
            return "What a beautiful day!\n Don't forget your mittens!"
        case .freezingDrizzle:
            return "So cold brrr! Keep warm!"
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return "Drive safe, the roads might be slippery!"
        case .icePellets:
            return "Ice Pellets"
        case .heavyIcePellets:
            return "Take cover!\n Heavy hail alert!"
        case .lightIcePellets:
            return "Light Ice Pellets"
        case .thunderstorm:
            return "Try to stay inside!\n Thunderstorm alert!"
        }
    }
    
  
}
