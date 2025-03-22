//
//  MovieInformationView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 15/05/2024.
//

import SwiftUI

struct MovieInformationView: View {
    
    var movieDetails: DetailsModel?
  
    var body: some View {
        VStack {
            if let movieDetails = movieDetails {
                
                HStack(alignment: .bottom) {
                    Text(movieDetails.title ?? "")
                        .font(.title3.bold())
                        .foregroundStyle(.yellow)
                }
              
                HStack(alignment: .top,spacing: 10) {
                    Text("\(movieDetails.originalLanguage?.uppercased() ?? "")")
                        .font(.headline)
                        .foregroundStyle(.red)
                        .padding(.trailing)
                        
                    Text ("Popularity")
                        .font(.headline.bold())
                        .foregroundStyle(.yellow)
                    
                    Text((String(format: "%.2f", movieDetails.popularity ?? 0.0)))
                        .font(.headline)
                        .foregroundStyle(.green)

                }
                
                HStack {
                    Text("Rating:")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                    
                    Spacer()
                    
                    ForEach(0..<5){ item in
                        Image(systemName: "star.fill")
                            .foregroundStyle(Int(movieDetails.voteAverage ?? 0.0) > item ? Color.yellow : Color.gray)
                    }
                }
            
                VStack(spacing: 0) {
                    Text(movieDetails.overview ?? "")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                        .multilineTextAlignment(.leading)
                        
                }
                
                HStack {
                    Text("Release Date:")
                        .font(.headline)
                        .foregroundStyle(.yellow)
                    Spacer()
                    Text(movieDetails.releaseDate ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                }
            }
        }
        .padding([.leading,.trailing])
    }
}
