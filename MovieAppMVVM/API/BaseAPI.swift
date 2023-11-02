//
//  BaseAPI.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 1.11.2023.
//

import Foundation
import Alamofire

enum  HTTPError: Error {
    case invalidURL
    case noGetData
    case decodingFailed
}

class BaseAPI<T: RequestRequirement> {
    func fetchData<M: Decodable>(target: T, responseType: M.Type, handler: @escaping (Result< M, NSError >) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = createParameter(task: target.task)
        
        let fullURL =  target.baseURL + target.path
        
        AF.request(
            fullURL,
            method: method,
            parameters: parameters.0,
            encoding: parameters.1,
            headers: headers).responseDecodable(of: M.self) { dataResponse in
                guard let statusCode = dataResponse.response?.statusCode else {
                    return handler(.failure(NSError()))
                }
                
                if statusCode == 200 {
                    guard let response = try? dataResponse.result.get() else {
                        return handler(.failure(NSError()))
                    }
                    
                    handler(.success(response))
                } else {
                    return handler(.failure(NSError()))
                }
            }
    }
}

extension BaseAPI {
    private func createParameter(task: Task) -> (Parameter, ParameterEncoding ) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
            
        case .requestWithParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
}
