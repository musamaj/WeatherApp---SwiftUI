//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Usama Jamil on 3/30/25.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    
    private let weatherService = WeatherService()
    
    func getWeather(for city: String) {
        weatherService.fetchWeather(for: city) { weather in
            self.weather = weather
        }
    }
}
