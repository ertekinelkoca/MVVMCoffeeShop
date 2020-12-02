//
//  Webservice.swift
//  MVVMCoffeeShop
//
//  Created by Ali Elkoca on 26.11.2020.
//

import Foundation
enum NetworkError : Error {
    
    case decodingError
    case domainError
    case urlError
}

struct Resources<T: Codable> {
    
    let url:URL
    
}

class WebService {
    
    func load<T>(resource:Resources<T>, completion: @escaping (Result<T, NetworkError>) -> Void){
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
                
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
