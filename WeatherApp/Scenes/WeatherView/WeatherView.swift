//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Usama Jamil on 3/30/25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city: String = "New York"
    
    var body: some View {
        VStack {
            TextField("Enter City", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Get Weather") {
                viewModel.getWeather(for: city)
            }
            .padding()
            
            if let weather = viewModel.weather {
                Text(weather.current.weather_descriptions.first ?? "N/A")
                    .font(.largeTitle)
                    .bold()
                
                Text("\(weather.current.temperature, specifier: "%.1f")°C")
                    .font(.title)
                
                Text(weather.current.weather_descriptions.first ?? "")
                    .italic()
            } else {
                Text("Enter a city to fetch weather.")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}
