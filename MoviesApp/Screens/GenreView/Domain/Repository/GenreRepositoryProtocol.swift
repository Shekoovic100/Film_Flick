//
//  GenreRepositoryProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation


protocol GenreRepositoryProtocol {
    func getGenreList() async throws -> [Genres]
}
