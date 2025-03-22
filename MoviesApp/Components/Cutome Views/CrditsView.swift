//
//  CreditsView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import SwiftUI

struct CreditsView: View {
    
    @EnvironmentObject var detailViewModel: DetailViewModel
    
    var body: some View {
        VStack {
            VStack {
                CashedImageView(imageUrlString: detailViewModel.imageDomainUrl + (detailViewModel.personDetails?.profilePath ?? ""), width: 340, height: 300)
            }
            
            VStack(alignment: .leading , spacing: 5) {
                
                Text(detailViewModel.personDetails?.name ?? "No Name")
                    .font(.title.bold())
                    .foregroundStyle(.yellow)
                    .padding(.top)
                
                HStack {
                    Text("Birthday :")
                        .font(.headline)
                    Spacer()
                    Text(detailViewModel.personDetails?.birthday ?? "No birthday" )
                        .font(.headline)
                        .padding(.trailing)
                }
                
                HStack {
                    Text("Place Of Birth :")
                        .font(.headline)
                    Spacer()
                    Text(detailViewModel.personDetails?.placeOfBirth ?? "No Birth Place" )
                        .font(.footnote)
                        .padding(.trailing)
                }
                
                HStack {
                    Text ("Popularity :")
                        .font(.headline)
                    Spacer()
                    Text((String(format: "%.2f", detailViewModel.personDetails?.popularity ?? 0.0 )))
                        .font(.headline)
                        .foregroundStyle(.green)
                        .padding(.trailing)
                }
            }
            .padding(.leading)
            
            HStack {
                Text(detailViewModel.personDetails?.biography ?? "No biography")
                    .font(.title3)
            }
            .padding()
            
            VStack {
                YellowButton(title: "IMDb Profile", url: URL(string: detailViewModel.baseActorURl + (detailViewModel.personDetails?.imdbId ?? ""))!, action:{
                    print("")
                })
                .padding(.bottom)
            }
        }
    }
}



