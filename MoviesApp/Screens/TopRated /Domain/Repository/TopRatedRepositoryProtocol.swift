//
//  TopRatedRepositoryProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation


protocol TopRatedRepositoryProtocol {
    func getTopRatedMovies(page: Int) async throws -> TopRatedModel
}
