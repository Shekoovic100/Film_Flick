//
//  YellowButton.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import SwiftUI

struct YellowButton: View {
    var title: String
    var url: URL
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            Rectangle()
                .frame(width: 200 ,height: 45)
                .foregroundStyle(.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    Link(title, destination: url)
                        .foregroundColor(.black)
                        .font(.title2.bold())
                }
        }
    }
}

struct YellowButton_Previews: PreviewProvider {
    
    static var previews: some View {
        YellowButton(title: "Sherif", url: URL(string: "https.google.com")!, action: {})
    }
}
