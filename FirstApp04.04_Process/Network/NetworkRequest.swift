//
//  NetworkRequest.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 20.05.2022.
//

import Foundation


class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func requestData(completion: @escaping (Result<Data, Error>) -> Void) {
        let key = "d7a4148b97ee8faefcd2dd48c6315e83"
        let latitude = 55.775043
        let longitude = 37.500408
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
