//
//  SimilarListView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 14/05/2024.
//

import SwiftUI

struct SimilarListView: View {
    
    @EnvironmentObject var viewModel: SimilarViewModel
    
    let genreId: Int
    let choice: String
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(viewModel.similarList.enumerated()),id: \.offset){ index , items  in
                    NavigationLink(destination: DetailView(movieId: items.id)) {
                        SimilarRowView(movie: items)
                    }
                }
                .listRowBackground(Color.theme.background)
                .listRowSeparatorTint(.orange)
                .listStyle(.plain)
            }
            .background( Color.theme.background)
            .navigationTitle(choice)
            .task {
                await viewModel.getAllSimilarListMovies(genreId: genreId)
            }
            .scrollContentBackground(.hidden)
            .environmentObject(viewModel)
        }
    }
}


struct SimilarListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let getSimilarService = SimilarServiceImplement()
        let SimilarRepository = SimilarRepository(service: getSimilarService)
        let getSimilarUseCase = SimilarUseCase(repository: SimilarRepository)
        let SimilarListViewModel = SimilarViewModel(useCase: getSimilarUseCase)
        
        SimilarListView(genreId: 12, choice: "")
            .preferredColorScheme(.dark)
            .environmentObject(SimilarListViewModel)
    }
}
