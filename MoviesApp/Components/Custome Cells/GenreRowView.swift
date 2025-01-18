//
//  GenreRowView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 14/05/2024.
//

import SwiftUI

struct GenreRowView: View {
    
    @State var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .frame(width: 160, height: 60)
                .overlay (
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray.opacity(0.4),lineWidth: 3)
                        .shadow(color: .gray, radius: 20)
                )
        }
    }
}

struct  GenreRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        GenreRowView(title: "dddd")
    }
}
