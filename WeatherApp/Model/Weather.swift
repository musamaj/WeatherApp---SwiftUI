//
//  Weather.swift
//  WeatherApp
//
//  Created by Usama Jamil on 3/30/25.
//

import Foundation

struct WeatherResponse: Codable {
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let temperature: Int
    let weather_descriptions: [String]
}
