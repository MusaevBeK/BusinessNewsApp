//
//  Request.swift
//  SomeAppForGitHub
//
//  Created by user on 15/5/22.
//

import Foundation

class ApiRequest {
    
    func request(urlString: String, completion: @escaping (Result<Data,Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(.failure(error))
                    
                    return
                }
                guard let data = data else {return}
                print(data)
                completion(.success(data))

            }
        }.resume()
        
    }
}
