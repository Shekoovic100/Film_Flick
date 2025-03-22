//
//  MovieCredit.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation

struct MovieCredit: Codable {
    
    let cast, crew: [CreditCast]?
    let id: Int?
}

struct CreditCast: Codable {
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let originalName, firstAirDate, name: String?
    let episodeCount: Int?
    let job: Job?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case order
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case name
        case episodeCount = "episode_count"
        case job
    }
    
}

enum Department: String, Codable {
    
    case creator = "Creator"
    case production = "Production"
    
}

enum Job: String, Codable {
    
    case creator = "Creator"
    case executiveProducer = "Executive Producer"
    case producer = "Producer"
}

enum OriginCountry: String, Codable {
    
    case gb = "GB"
    case us = "US"
}

enum OriginalLanguage: String, Codable {
    
    case de = "de"
    case en = "en"
}
