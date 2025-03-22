//
//  SimilarRepositoryProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 04/06/2024.
//

import Foundation


protocol SimilarRepositoryProtocol {
    func fetchSimilarMovies(genreId: Int) async throws -> DiscoverModel
}
