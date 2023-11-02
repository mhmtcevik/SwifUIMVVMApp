//
//  MovieListViewModel.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 2.11.2023.
//

import Foundation

class MovieListViewModel: BaseViewModel {
    @Published var searchingMovies: [Movie] = []
    
    private let httpService = HTTPService()
    
    private var apiKey: String {
        Constants.API.apiKey
    }
    
    func searchMovie(searchText: String) {
        if searchText.isEmpty {
            return
        }
        
        loadingStatus = .loading
        
        httpService.fetchMovieBySearching(path: "", parameters: ["s": searchText, "apikey": apiKey]) { result in
            switch result {
            case .success(let movies):
                let movies = movies.movies
                
                DispatchQueue.main.async { [weak self] in
                    self?.searchingMovies = movies
                    self?.loadingStatus = .success
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.loadingStatus = .failed
                }
            }
        }
    }
    
}
