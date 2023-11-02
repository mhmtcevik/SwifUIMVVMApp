//
//  ContentView.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 1.11.2023.
//

import SwiftUI
import Alamofire

struct MovieListScreen: View {
    @ObservedObject private var viewModel = MovieListViewModel()
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                textField
                
                if viewModel.loadingStatus == .loading {
                    Spacer()
                    progressBar
                } else if viewModel.loadingStatus == .success {
                    movieList
                } else if viewModel.loadingStatus == .failed {
                    Spacer()
                    failedImage
                } else if viewModel.loadingStatus == .none {
                    Spacer()
                    emptyImage
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    //MARK: Views
    private var textField: some View {
        TextField("Search Movie...", text: $searchText)
            .onSubmit {
                self.viewModel.searchMovie(searchText: searchText)
            }
            .textFieldStyle(.roundedBorder)
            .frame(height: 50, alignment: .center)
    }
    
    private var movieList: some View {
        List(viewModel.searchingMovies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId), label: {
                MovieView(movie: movie)
            })
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
    }
    
    private var progressBar: some View {
        ProgressView()
            .progressViewStyle(.linear)
            .scaleEffect(CGSize(width: 2.0, height: 2.0))
    }
    
    private var failedImage: some View {
        Image(systemName: "nosign.app")
            .resizable()
            .frame(width: 100, height: 100)
            .opacity(0.8)
    }
    
    private var emptyImage: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .frame(width: 100, height: 100)
            .opacity(0.8)
    }
}

#Preview {
    MovieListScreen()
}
