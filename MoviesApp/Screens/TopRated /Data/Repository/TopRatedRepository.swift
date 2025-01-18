//
//  TopRatedRepository.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


class TopRatedRepository: TopRatedRepositoryProtocol {


    private let topRatedService: TopRatedServiceProtocol
    
    init(service: TopRatedServiceProtocol) {
        self.topRatedService = service
    }
    
    func getTopRatedMovies(page: Int) async throws -> TopRatedModel {
        try await topRatedService.fetchTopRatedMovies(page: page)
    }
    
    
}
