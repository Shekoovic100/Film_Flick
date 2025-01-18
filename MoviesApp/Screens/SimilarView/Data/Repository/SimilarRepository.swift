//
//  SimilarRepository.swift
//  MoviesApp
//
//  Created by Sherif Samy on 04/06/2024.
//

import Foundation


class SimilarRepository: SimilarRepositoryProtocol {
    
    private let service: SimilarService
    
    init(service: SimilarService) {
        self.service = service
    }
    
    func fetchSimilarMovies(genreId: Int) async throws -> DiscoverModel {
        try await service.fetchSiamilarMovies(genreId: genreId)
    }
    
}
