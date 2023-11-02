//
//  MovieImage.swift
//  MovieAppMVVM
//
//  Created by Mehmet Çevık on 2.11.2023.
//

import SwiftUI
import Foundation

struct MovieImage: View {
    let url: URL?
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: url, scale: 1.0) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height, alignment: .center)
        } placeholder: {
            ProgressView()
                .progressViewStyle(.circular)
                .frame(width: width, height: height, alignment: .center)
        }

    }
}


