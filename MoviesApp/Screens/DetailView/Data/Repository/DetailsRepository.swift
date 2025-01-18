//
//  DetailsRepository.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation



class DetailsRepository: DetailsRepositoryProtocol {


    private let service: DetailServiceProtocol
    
    init(service: DetailServiceProtocol) {
        self.service = service
    }
    
    func getMovieDetails(movieId: Int) async throws -> DetailsModel {
        try await service.getMovieDetail(movieId: movieId)
    }
    
    func getMovieCredits(movieId: Int) async throws -> CreditsModel {
        try await service.getMovieCredits(movieId: movieId)
    }
    
    func getPersonDetails(PersonId: Int) async throws -> ActorDetails {
        try await service.getPersonDetails(personId: PersonId)
    }
    
    func getPersonMovies(personId: Int) async throws -> MovieCredit {
        try await service.getPersonMovies(personId: personId)
    }
    
    
  
    

    
    
}
