//
//  DiscoverCellRow.swift
//  MoviesApp
//
//  Created by Sherif Samy on 20/05/2024.
//

import SwiftUI

struct DiscoverCellRow: View {
    
   
    @EnvironmentObject var viewModel: MoviesViewModel
    let movie: DiscoverResults
    
    var body: some View {
        VStack {
            DiscoverCashedImage(imageUrlString: viewModel.imageDomainUrl + (movie.posterPath ?? ""))
                .environmentObject(viewModel)
        }
    }
}
