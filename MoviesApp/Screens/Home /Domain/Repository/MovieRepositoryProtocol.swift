//
//  MovieRepositoryProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getDiscoverMovies(page: Int) async throws -> DiscoverModel
    func getupComingMovies(page: Int) async throws -> UpComingModel
}
