//
//  CreditsRowView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 20/05/2024.
//

import SwiftUI

struct CreditsRowView: View {
    
    @EnvironmentObject var detailViewModel: DetailViewModel
    let movie: Cast
    
    var body: some View {
        VStack {
            CashedImageView(imageUrlString: detailViewModel.imageDomainUrl + (movie.profilePath ?? ""), width: 190, height: 180)
            
            Text(movie.name ?? "")
                .font(.headline)
                .foregroundStyle(.yellow)
        }
    }
}
