//
//  RequestType.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 1.11.2023.
//

import Foundation
import Alamofire

typealias Parameter = [String : Any]
typealias Header = [String : String]

protocol RequestRequirement {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Header? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case requestWithParameters(parameters: Parameter, encoding: ParameterEncoding)
}

