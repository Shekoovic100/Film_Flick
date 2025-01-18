//
//  TopRatedRowView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import SwiftUI

struct TopRatedRowView: View {
    
    @EnvironmentObject var viewModel: TopRatedViewModel
    let movie: TopRatedResults
    
    var body: some View {
        LazyVStack {
            
            CashedImageView(imageUrlString: viewModel.imageDomainUrl + (movie.posterPath ?? ""), width: 350, height: 500)
//            .overlay (
//                RoundedRectangle(cornerRadius: 17)
//                    .stroke(.gray.opacity(0.4),lineWidth: 3)
//                    .shadow(color: .gray, radius: 20) )
//            .frame(width: 200 , height: 500)
            Text(movie.title ?? "")
                .font(.headline.bold())
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
        }
        .padding(.leading)
    }
}
