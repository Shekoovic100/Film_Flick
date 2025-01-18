//
//  DetailsRepositotyProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation


protocol DetailsRepositoryProtocol {
    
    func getMovieDetails(movieId: Int) async throws -> DetailsModel
    func getMovieCredits(movieId: Int) async throws -> CreditsModel
    func getPersonDetails(PersonId: Int) async throws -> ActorDetails
    func getPersonMovies(personId: Int) async throws -> MovieCredit
    
}
