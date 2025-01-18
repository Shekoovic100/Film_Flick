//
//  CashedImageView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 04/06/2024.
//

import SwiftUI
import Kingfisher

struct CashedImageView: View {
    
    let imageUrlString: String
    let width: CGFloat
    let height: CGFloat
  
    
    var body: some View {
        KFImage.url(URL(string: imageUrlString))
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .resizable()
            .frame(width: width , height: height)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

//#Preview {
//    CashedImageView(imageUrlString: "https://image.tmdb.org/t/p/w500/saVWvLE0haJTrH1c1YS68VTDKyC.jpg", width: 190, height: 190)
//      
//}


struct CashedImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        CashedImageView(imageUrlString: "https://image.tmdb.org/t/p/w500/saVWvLE0haJTrH1c1YS68VTDKyC.jpg", width: 190, height: 190)
    }
}
