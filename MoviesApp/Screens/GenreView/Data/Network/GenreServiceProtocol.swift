//
//  GenreServiceProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


protocol GenreServiceProtocol {
    func fetchGenreList() async throws -> [Genres]
}


class GenreService: GenreServiceProtocol {
    
    private let apiClient = APIClient()
    
    func fetchGenreList() async throws -> [Genres] {
        let genreData = try await apiClient.request(urlString: .fetchGenreList, method: .get, type: GenreModel.self)
        return genreData.genres
    }

    
}
