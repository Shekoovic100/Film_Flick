//
//  Route.swift
//  MoviesApp
//
//  Created by Sherif Samy on 23/05/2024.
//

import Foundation


enum Route {
    
    static let BaseURL = "https://api.themoviedb.org/3/"
    private var getAPIKey: String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "kisekyons") as? String else {return ""}
        return apiKey
    }
    case getMovieDetail(Int)
    case fetchTopRatedMovies(Int)
    case getActorInformation(Int)
    case getCredits(Int)
    case upComingMovies(Int)
    case fetchDiscoverData(Int)
    case similarMovies(Int)
    case fetchGenreList
    case fetchMoviewForPerson(Int)
    

    var description: String {
        switch self {
        case .fetchTopRatedMovies(let page):
            return "movie/top_rated?api_key=\(getAPIKey)&page=\(page)"
        case .getActorInformation(let personId):
            return "person/\(personId)?api_key=\(getAPIKey)"
        case .getCredits(let movieId):
            return "movie/\(movieId)/credits?api_key=\(getAPIKey)"
        case .getMovieDetail(let movieId):
            return "movie/\(movieId)?api_key=\(getAPIKey)"
        case .upComingMovies(let page):
            return "movie/upcoming?api_key=\(getAPIKey)&page=\(page)"
        case .fetchDiscoverData(let page):
            return "discover/movie?api_key=\(getAPIKey)&page=\(page)"
        case .similarMovies(let genreId):
            return "movie/\(genreId)/similar?api_key=\(getAPIKey)"
        case .fetchGenreList:
            return "genre/movie/list?api_key=\(getAPIKey)"
        case .fetchMoviewForPerson(let personId):
            return "person/\(personId)/movie_credits?api_key=\(getAPIKey)"
        }
    }
}


