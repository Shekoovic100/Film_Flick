//
//  DetailService.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation


protocol DetailServiceProtocol {
    func getMovieDetail(movieId: Int) async throws -> DetailsModel
    func getMovieCredits(movieId: Int) async throws -> CreditsModel
    func getPersonDetails(personId: Int) async throws -> ActorDetails
    func getPersonMovies(personId: Int) async throws -> MovieCredit
}


class DetailService: DetailServiceProtocol {

    
    private let apiClient = APIClient()
    
    func getMovieDetail(movieId: Int) async throws -> DetailsModel {
        let movieDetails = try await apiClient.request(urlString: .getMovieDetail(movieId), method: .get, type: DetailsModel.self)
        return movieDetails
        
    }
    
    func getMovieCredits(movieId: Int) async throws -> CreditsModel {
        let creditsDetails = try await apiClient.request(urlString: .getCredits(movieId), method: .get, type: CreditsModel.self)
        return creditsDetails
    }
    
    func getPersonDetails(personId: Int) async throws -> ActorDetails {
        let actorDetails = try await apiClient.request(urlString: .getActorInformation(personId), method: .get, type: ActorDetails.self)
        return actorDetails
    }
    
    
    func getPersonMovies(personId: Int) async throws -> MovieCredit {
        let personMovies = try await apiClient.request(urlString: .fetchMoviewForPerson(personId), method: .get, type: MovieCredit.self)
        return personMovies
    }
    


}
