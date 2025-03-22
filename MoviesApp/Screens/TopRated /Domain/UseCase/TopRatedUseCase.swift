//
//  TopRatedUseCase.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


protocol TopRatedUseCaseProtocol {
    func excuteTopRated(page: Int) async throws -> TopRatedModel
}


class TopRatedUseCase: TopRatedUseCaseProtocol {
    
    private let repository: TopRatedRepositoryProtocol
    
    init(repository: TopRatedRepositoryProtocol) {
        self.repository = repository
    }
    func excuteTopRated(page: Int) async throws -> TopRatedModel {
        try await repository.getTopRatedMovies(page: page)
    }
    
    
}
