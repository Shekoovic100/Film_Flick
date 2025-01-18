//
//  MoviesPersonRowView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 02/06/2024.
//

import SwiftUI

struct MoviesPersonRowView: View {

    @EnvironmentObject var detailViewModel: DetailViewModel
    let movie: CreditCast
    
    var body: some View {
        VStack {
            CashedImageView(imageUrlString: detailViewModel.imageDomainUrl + (movie.posterPath ?? ""),width: 190 ,height: 190)
            Text(movie.name ?? "")
                .font(.headline)
                .foregroundStyle(.yellow)
        }
    }
}
