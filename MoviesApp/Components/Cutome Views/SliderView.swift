//
//  SliderView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 23/05/2024.
//

import SwiftUI

struct SliderView: View {
    
    @EnvironmentObject var movieViewModel: MoviesViewModel
    
    @State var selection: Int = 0
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
            TabView(selection: $selection) {
                ForEach(movieViewModel.discoverMoviesList.indices, id: \.self) { movie in
                    NavigationLink(destination: DetailView(movieId: movieViewModel.discoverMoviesList[movie].id)){
                        DiscoverCellRow(movie: movieViewModel.discoverMoviesList[movie])
                    }
                }
            }
            .frame(height: 320)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .onReceive(timer, perform: { _ in
                withAnimation {
                    selection = selection < movieViewModel.discoverMoviesList.count ? selection + 1 : 0
                }
            })
            .environmentObject(movieViewModel)
   
    }
}

