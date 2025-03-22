//
//  UpComingModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 02/06/2024.
//

import Foundation



struct UpComingModel: Codable {
    
    let page: Int
    let results: [UpComingResults]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
           case page, results
           case totalPages = "total_pages"
           case totalResults = "total_results"
       }
}

struct UpComingResults: Codable,Identifiable, Hashable {

    let id: Int
    let adult: Bool?
    let backdropPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"

    }
    
    init(id: Int , adult: Bool? = nil, backdropPath: String? = nil, originalLanguage: String? = nil, originalTitle: String? = nil, overview: String? = nil, popularity: Double? = nil, posterPath: String? = nil, releaseDate: String? = nil, title: String? = nil, video: Bool? = nil, voteAverage: Double? = nil, voteCount: Int? = nil) {
        self.id = id
       self.adult = adult
       self.backdropPath = backdropPath
       self.originalLanguage = originalLanguage
       self.originalTitle = originalTitle
       self.overview = overview
       self.popularity = popularity
       self.posterPath = posterPath
       self.releaseDate = releaseDate
       self.title = title
       self.video = video
       self.voteAverage = voteAverage
       self.voteCount = voteCount
   }
   
}
