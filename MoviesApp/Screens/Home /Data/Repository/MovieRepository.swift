//
//  MovieRepository.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


class MovieRepository: MovieRepositoryProtocol {
    
    private let movieService: MovieService
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func getDiscoverMovies(page: Int) async throws -> DiscoverModel {
       return try await movieService.fetchDiscoverData(page: page)
    }
    
    func getupComingMovies(page: Int) async throws -> UpComingModel {
        return try await movieService.fetchUpComingMovies(page: page)
    }
    
    
}
