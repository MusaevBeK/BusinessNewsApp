//
//  Response.swift
//  SomeAppForGitHub
//
//  Created by user on 15/5/22.
//

import Foundation

class ApiResponse {
    
    let networkServices = ApiRequest()
    
    func getResponse(urlString: String, response: @escaping (NewsModel?)-> Void) {
        networkServices.request(urlString: urlString) { (result) in
            switch result {
            case.success(let data):
                do {
                    let model = try JSONDecoder().decode(NewsModel.self, from: data)
                    response(model)
                    print("YESSSSS\(model)")
                } catch let jsonError {
                    print("ERRRRRRR\(jsonError)")
                }
            case .failure(_):
                response(nil)
            }
        }
    }
}
