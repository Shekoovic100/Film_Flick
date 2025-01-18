//
//  SimilarUseCase.swift
//  MoviesApp
//
//  Created by Sherif Samy on 04/06/2024.
//

import Foundation


protocol SimilarUseCaseProtocol {
    func fetchSimilarMoviesList(genreId: Int) async throws -> DiscoverModel
}


class SimilarUseCase: SimilarUseCaseProtocol {
  
    
    private let repository: SimilarRepositoryProtocol
    init(repository: SimilarRepositoryProtocol) {
        self.repository = repository
    }

    func fetchSimilarMoviesList(genreId: Int) async throws -> DiscoverModel {
        try await repository.fetchSimilarMovies(genreId: genreId)
    }
    
}
