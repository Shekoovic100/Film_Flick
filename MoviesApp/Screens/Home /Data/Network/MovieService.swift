//
//  MovieService.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


protocol MovieService {
    
    func fetchDiscoverData(page: Int) async throws -> DiscoverModel
    func fetchUpComingMovies(page: Int) async throws -> UpComingModel
}


class MovieServicesImplement: MovieService {

    private let apiClient = APIClient()
    
    func fetchDiscoverData(page: Int) async throws -> DiscoverModel {
        let data = try await apiClient.request(urlString: .fetchDiscoverData(page), method: .get, type: DiscoverModel.self)
        return data
    }
    
    func fetchUpComingMovies(page: Int) async throws -> UpComingModel {
        let data = try await apiClient.request(urlString: .upComingMovies(page), method: .get, type: UpComingModel.self)
        return data
    }
    


    
}
