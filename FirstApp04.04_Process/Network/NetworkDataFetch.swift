//
//  NetworkDataFetch.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 21.05.2022.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchWeather(response: @escaping (WeatherModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData { result in
            switch result {
                
            case .success(let data):
                do {
                    let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                    response(weather, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
}
