//
//  HTTPService.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 1.11.2023.
//

import Foundation

protocol MovieAPI {
    func fetchMovieBySearching(path: String, parameters: Parameter, completionHandler: @escaping (Result<IMDBResponse, NSError>) -> Void)
    func fetchMovieById(path: String, parameters: Parameter, completionHandler: @escaping (Result<Movie, NSError>) -> Void)
}

class HTTPService: BaseAPI<Networking>, MovieAPI {
    
    func fetchMovieById(
        path: String,
        parameters: Parameter,
        completionHandler: @escaping (Result<Movie, NSError>) -> Void) {
            
            fetchData(target: .getMovieById(path: path, parameter: parameters), responseType: Movie.self) { result in
                completionHandler(result)
            }
        }
    
    func fetchMovieBySearching(
        path: String,
        parameters: Parameter,
        completionHandler: @escaping (Result<IMDBResponse, NSError>) -> Void) {
            
            fetchData(target: .getMoviesBySearching(path: path, parameter: parameters), responseType: IMDBResponse.self) { result in
                completionHandler(result)
            }
            
        }
    
}
