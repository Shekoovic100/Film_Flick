//
//  favouritesDetailView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 21/05/2024.
//

import SwiftUI

struct favouritesDetailView: View {
    
    @EnvironmentObject var viewModel: MoviesViewModel
    var item: Movie
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    CashedImageView(imageUrlString: viewModel.imageDomainUrl + (item.posterPath ?? ""), width: 360, height: 300)
               
                    HStack(alignment: .bottom) {
                        Text(item.title ?? "Unknown Title")
                            .font(.title3.bold())
                            .foregroundStyle(.yellow)
                        
                    }
                    
                    Text(item.details ?? "No Details")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                .padding()
                .navigationTitle("Wishlist Details")
                .navigationBarTitleDisplayMode(.inline)
                .environmentObject(viewModel)
            }
        }
    }
}

