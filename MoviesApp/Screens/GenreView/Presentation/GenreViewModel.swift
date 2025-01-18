//
//  GenreViewModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 22/05/2024.
//

import Foundation

@MainActor class GenreViewModel: ObservableObject {
    
    @Published var genreList: [Genres] = []
    @Published var isLoading: Bool = false
    
    private let genreUseCase: GenreListUseCaseProtocol
    
    init(genreUseCase: GenreListUseCaseProtocol) {
        self.genreUseCase = genreUseCase
    }

    func getListOfGenres() async {
      isLoading = true
        do {
            genreList = try await genreUseCase.excute()
        }catch {
            print("Error in fetching GenreList")
        }
        isLoading = false
    }
}
