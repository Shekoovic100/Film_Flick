//
//  GenreRepository.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation



class GenreRepository: GenreRepositoryProtocol {
    
    private let service: GenreServiceProtocol
    
    init(service: GenreServiceProtocol) {
        self.service = service
    }
    
    func getGenreList() async throws -> [Genres] {
        try await service.fetchGenreList()
    }
    
}
