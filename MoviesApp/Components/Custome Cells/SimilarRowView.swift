//
//  SimilarCell.swift
//  MoviesApp
//
//  Created by Sherif Samy on 14/05/2024.
//

import SwiftUI

struct SimilarRowView: View {
    
    @EnvironmentObject var viewModel: SimilarViewModel
    let movie: DiscoverResults
    
    var body: some View {
        HStack(alignment: .top,spacing: 10) {
            HStack {
                CashedImageView(imageUrlString: viewModel.imageDomainUrl + (movie.posterPath ?? ""), width: 100, height: 100)
                VStack(alignment: .leading,spacing: 5) {
                    Text(movie.title ?? "")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
}

