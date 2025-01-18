//
//  TopRatedServiceProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


protocol TopRatedServiceProtocol {
    func fetchTopRatedMovies(page: Int) async throws -> TopRatedModel
}


class TopRatedServiceImplement: TopRatedServiceProtocol {
    
    private let apiClient = APIClient()
    
    func fetchTopRatedMovies(page: Int) async throws -> TopRatedModel {
        let topRatedData = try await apiClient.request(urlString: .fetchTopRatedMovies(page), method: .get, type: TopRatedModel.self)
        return topRatedData
    }
    
}
