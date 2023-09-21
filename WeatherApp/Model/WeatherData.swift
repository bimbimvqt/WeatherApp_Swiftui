//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Tuấn Vương on 21/09/2023.
//


import Foundation
import CoreLocation

struct WeatherData: Codable {
    let cityName: String
    let temperature: Double
    let condition: String
   
}

struct WeatherResponse: Codable {
    let name: String
    let main: MainWeaether
    let weather: [Weather]
}


struct MainWeaether: Codable {
    let temp: Double
    
}

struct Weather: Codable {
    let description: String
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWidthError error: Error) {
        print(error.localizedDescription)
    }
}
