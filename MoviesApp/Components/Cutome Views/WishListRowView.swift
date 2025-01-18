//
//  WishListRowView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 15/05/2024.
//

import SwiftUI

struct WishListRowView: View {
    
    let imageUrl: String
    let title: String
    
    var body: some View {
    //    HStack(alignment: .top,spacing: 10) {
            HStack {
                CashedImageView(imageUrlString: imageUrl, width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
               
                VStack(alignment: .leading,spacing: 5) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.yellow)
                }
            }
      //  }
    }
}

