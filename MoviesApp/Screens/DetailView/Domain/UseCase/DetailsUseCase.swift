//
//  DetailsUseCase.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation


protocol DetailsUseCaseProtocol {
    
    func excuteMovieDetails(movieId: Int) async throws -> DetailsModel
    func excuteCredit(movieId: Int) async throws -> CreditsModel
    func excutePersonalDetails(personId: Int) async throws -> ActorDetails
    func excutePersonMovies(personId: Int) async throws -> MovieCredit
}


class DetailsUseCase: DetailsUseCaseProtocol {


 
    private let repository: DetailsRepositoryProtocol
    
    init(repository: DetailsRepositoryProtocol) {
        self.repository = repository
    }
    
    func excuteMovieDetails(movieId: Int) async throws -> DetailsModel {
        try await repository.getMovieDetails(movieId: movieId)
    }
    
    func excuteCredit(movieId: Int) async throws -> CreditsModel {
        try await repository.getMovieCredits(movieId: movieId)
    }
    
    func excutePersonalDetails(personId: Int) async throws -> ActorDetails {
        try await repository.getPersonDetails(PersonId: personId)
    }
    
    func excutePersonMovies(personId: Int) async throws -> MovieCredit {
        try await repository.getPersonMovies(personId: personId)
    }
    
    
    
}
