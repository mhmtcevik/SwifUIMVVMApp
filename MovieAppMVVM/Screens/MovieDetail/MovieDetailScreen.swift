//
//  MovieDetailScreen.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 2.11.2023.
//

import SwiftUI

struct MovieDetailScreen: View {
    let imdbId: String
    
    @ObservedObject private var viewModel = DetailViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if viewModel.loadingStatus == .loading {
                    Spacer()
                    progressBar
                } else if viewModel.loadingStatus == .success {
                    movieImage
                    details
                } else if viewModel.loadingStatus == .failed {
                    Spacer()
                    failedImage
                }
                
                Spacer()
            }
            .onAppear(perform: {
                viewModel.fetchMovieById(imdbId: imdbId)
            })
        }
    }
    
    var movieImage: some View {
        MovieImage(url: viewModel.posterURL, width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.bottom, 15)
    }
    
    var details: some View {
        VStack(content: {
            Text(viewModel.title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            
            HStack(content: {
                Text("IMDB Rating: \(viewModel.imdbRating)")
                    .font(.body)
                    .foregroundStyle(Color.black.opacity(0.7))
                
                Spacer()
                
                Text("Director: \(viewModel.director)")
                    .font(.body)
                    .foregroundStyle(Color.black.opacity(0.7))
            })
            .padding(.bottom, 20)
            
            Text(viewModel.plot)
                .multilineTextAlignment(.leading)
        })
        .padding(.horizontal, 24)
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
    }
}

#Preview {
    MovieDetailScreen(imdbId: "")
}
