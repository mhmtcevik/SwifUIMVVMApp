//
//  DetailViewModel.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 2.11.2023.
//

import Foundation

class DetailViewModel: ObservableObject {
    private var movieDetail: MovieDetail?
    private let httpService = HTTPService()
    
    private var apiKey: String {
        Constants.API.apiKey
    }
    
    @Published var loadingStatus: FetchingStatus = .none
    
    var title: String {
        movieDetail?.title ?? ""
    }
    
    var imdbRating: String {
        movieDetail?.imdbRating ?? ""
    }
    
    var director: String {
        movieDetail?.director ?? ""
    }
    
    var plot: String {
        movieDetail?.plot ?? ""
    }
    
    var posterURL: URL? {
        movieDetail?.posterURL
    }
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func fetchMovieById(imdbId: String) {
        loadingStatus = .loading
        
        httpService.fetchMovieById(path: "", parameters: ["i": imdbId, "apikey": apiKey]) { result in
            switch result {
            case .success(let success):
                self.movieDetail = success
                self.loadingStatus = .success
                
            case .failure(_):
                self.loadingStatus = .failed
            }
        }
    }
    
}
