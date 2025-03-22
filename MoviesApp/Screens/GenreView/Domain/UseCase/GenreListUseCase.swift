//
//  GenreListUseCase.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


protocol GenreListUseCaseProtocol {
    
    func excute() async throws -> [Genres]
}


class GenreListUseCase: GenreListUseCaseProtocol {
    
    private let repository: GenreRepositoryProtocol
    
    init(repository: GenreRepositoryProtocol) {
        self.repository = repository
    }
    
    func excute() async throws -> [Genres] {
        try await repository.getGenreList()
    }
    
}
