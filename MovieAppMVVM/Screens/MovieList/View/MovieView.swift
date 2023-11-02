//
//  MovieView.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 2.11.2023.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 10, content: {
            MovieImage(url: movie.posterURL, width: 80, height: 80)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                
                Spacer().frame(height: 10)
                
                Text("Realise Date: \(movie.year)")
                    .font(.footnote)
            }
        })
    }
}

#Preview {
    MovieView(
        movie: Movie(
        title: "My Movie",
        year: "10/12/2023",
        imdbId: "7.9",
        poster: "https://m.media-amazon.com/images/M/MV5BNjQwOGM2YTItMGYwNC00YTM4LWI0Y2QtZjQ2ZDcyMmRjMTFhXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg"))
}

