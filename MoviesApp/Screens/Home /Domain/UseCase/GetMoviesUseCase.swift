//
//  GetMoviesUseCase.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


protocol GetMoviesUseCaseProtocol {
    
    func excuteDiscoverMovies(page: Int) async throws -> DiscoverModel
    func excuteUpcomingMovie(page: Int) async throws -> UpComingModel
}

class GetMoviesUseCase: GetMoviesUseCaseProtocol {

    private let repository: MovieRepositoryProtocol

    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    
    func excuteDiscoverMovies(page: Int) async throws -> DiscoverModel {
        try await repository.getDiscoverMovies(page: page)
    }
    
    func excuteUpcomingMovie(page: Int) async throws -> UpComingModel {
        try await repository.getupComingMovies(page: page)
    }
    
}
