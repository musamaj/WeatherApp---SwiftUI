//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Usama Jamil on 3/30/25.
//

import Foundation

class WeatherService {
    let apiKey = "99ff4df77fb944e8793f660be6ff3a56"
    
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?) -> Void) {
        let urlString = "http://api.weatherstack.com/current?access_key=\(apiKey)&query=city"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let weatherData = try decoder.decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(weatherData)
                    }
                } catch {
                    print("Decoding error:", error)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
