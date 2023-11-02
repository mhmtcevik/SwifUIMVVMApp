//
//  Networking.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 2.11.2023.
//

import Foundation
import Alamofire

enum Networking {
    case getMoviesBySearching(path: String, parameter: Parameter)
    case getMovieById(path: String, parameter: Parameter)
}

extension Networking: RequestRequirement {
    var baseURL: String {
        switch self {
        case .getMoviesBySearching(_, _):
            Constants.API.apiBaseURL
        case .getMovieById(_, _):
            Constants.API.apiBaseURL
        }
    }
    
    var path: String {
        switch self {
        case .getMoviesBySearching(let path, _):
            path
        case .getMovieById(let path, _):
            path
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMoviesBySearching(_, _):
            HTTPMethod.get
        case .getMovieById(_, _):
            HTTPMethod.get
        }
    }
    
    var task: Task {
        switch self {
        case .getMoviesBySearching(_, let parameter):
            Task.requestWithParameters(parameters: parameter, encoding: URLEncoding.queryString)
        case .getMovieById(_, let parameter):
            Task.requestWithParameters(parameters: parameter, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: Header? {
        switch self {
        case .getMoviesBySearching(_, _):
            [:]
        case .getMovieById(_, _):
            [:]
        }
    }
    
    
}
