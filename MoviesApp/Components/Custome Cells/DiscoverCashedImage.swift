//
//  DiscoverCashedImage.swift
//  MoviesApp
//
//  Created by Sherif Samy on 04/06/2024.
//

import SwiftUI
import Kingfisher

struct DiscoverCashedImage: View {
    
    let imageUrlString: String
    
    var body: some View {
        
        KFImage.url(URL(string: imageUrlString))
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .resizable()
            .frame(width: 200)
            .frame(maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

//#Preview {
//    DiscoverCashedImage(imageUrlString: "https://image.tmdb.org/t/p/w500/saVWvLE0haJTrH1c1YS68VTDKyC.jpg")
//        .scaledToFit()
//        .scaledToFill()
//}


struct DiscoverCashedImage_Previews: PreviewProvider {
    
    static var previews: some View {
        DiscoverCashedImage(imageUrlString: "https://image.tmdb.org/t/p/w500/saVWvLE0haJTrH1c1YS68VTDKyC.jpg")
            .scaledToFit()
            .scaledToFill()
    }
}
