//
//  TopRated.swift
//  MoviesApp
//
//  Created by Sherif Samy on 08/05/2024.
//

import SwiftUI

struct TopRated: View {
    
    @EnvironmentObject var viewModel: TopRatedViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(viewModel.getTopRatedList().enumerated()),id: \.offset) { index, movie in
                    NavigationLink(destination: DetailView(movieId: movie.id)) {
                        TopRatedRowView(movie: movie)
                            .onAppear {
                                if movie.id == viewModel.getTopRatedList().last?.id {
                                    viewModel.loadData()
                                }
                            }
                    }
                }
            }
            .environmentObject(viewModel)
            .navigationTitle("Top Rated")
            .task {
                await viewModel.getTopRatedMovies()
            }
        }
    }
}

struct TopRated_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let topRatedService = TopRatedServiceImplement()
        let topRatedRepository = TopRatedRepository(service: topRatedService)
        let topRatedUseCase = TopRatedUseCase(repository: topRatedRepository)
        let topRatedViewModel = TopRatedViewModel(useCase: topRatedUseCase)
        
        TopRated()
            .preferredColorScheme(.dark)
            .environmentObject(topRatedViewModel)
    }
}
