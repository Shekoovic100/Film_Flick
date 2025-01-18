//
//  GenresView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 13/05/2024.
//

import SwiftUI

struct GenresView: View {
    
    @EnvironmentObject var viewModel: GenreViewModel
   

    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: adaptiveColumn , spacing: 30) {
                    ForEach(Array(viewModel.genreList.enumerated()),id: \.offset) { index,item in
                        NavigationLink(destination: SimilarListView(genreId: item.id , choice: item.name )) {
                            GenreRowView(title: item.name)
                        }
                    }
                }
                .task {
                    await viewModel.getListOfGenres()
                }
            }
            .navigationTitle("Genres")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.theme.background)
            .environmentObject(viewModel)
        }
    }
}


struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        
        let service = GenreService()
        let genreRepository = GenreRepository(service: service)
        let getGenreUseCase = GenreListUseCase(repository: genreRepository)
        let genreListViewModel = GenreViewModel(genreUseCase: getGenreUseCase)
        
        GenresView()
            .preferredColorScheme(.dark)
            .environmentObject(genreListViewModel)
    }
}

