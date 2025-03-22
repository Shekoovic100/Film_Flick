//
//  GenreModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 13/05/2024.
//

import Foundation


struct GenreModel: Codable {
    let genres: [Genres]
}

struct Genres: Codable, Identifiable {
    let id: Int
    let name: String
}
