//
//  NetworkEngine.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 04/02/22.
//
//Network engine is actually responsible to request URL for data
import Foundation

class NetworkEngine {
    
    class func request < T: Codable > (endpoint: Endpoint, completion: @escaping(Result < T, Error > ) -> ()) {
            
            var components = URLComponents()
            components.scheme = endpoint.scheme
            components.host = endpoint.baseURL
            components.path = endpoint.path
            components.queryItems = endpoint.parameters

            guard let url = components.url else { return }

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = endpoint.method
        
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: urlRequest) {
                data,
                response,
                error in
                guard error == nil
                else {
                    completion(.failure(error!))
                    print(error?.localizedDescription ?? "Unknown error")
                    return
                }
                guard response != nil,
                let data = data
                else {
                    return
                }
                DispatchQueue.main.async {
                    if let responseObject =
                        try? JSONDecoder().decode(T.self, from: data) {
                            completion(.success(responseObject))
                        } else {
                            let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response"])
                            completion(.failure(error))
                        }
                }
            }
           
            dataTask.resume()
        }
    }
