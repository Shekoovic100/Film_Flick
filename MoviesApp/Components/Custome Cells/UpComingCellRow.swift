//
//  UpComingCellRow.swift
//  MoviesApp
//
//  Created by Sherif Samy on 02/06/2024.
//

import SwiftUI

struct UpComingCellRow: View {

    @EnvironmentObject var viewModel: MoviesViewModel
    let movie: UpComingResults
    
    var body: some View {
        VStack {
            CashedImageView(imageUrlString: viewModel.imageDomainUrl + (movie.posterPath ?? ""), width: 180, height: 180)
                Text(movie.title ?? "")
                .font(.subheadline.bold())
                    .foregroundStyle(.yellow)
                   
            }
        .environmentObject(viewModel)
    }
}
