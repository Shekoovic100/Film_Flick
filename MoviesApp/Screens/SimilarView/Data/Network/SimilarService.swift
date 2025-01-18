//
//  SimilarService.swift
//  MoviesApp
//
//  Created by Sherif Samy on 04/06/2024.
//

import Foundation


protocol SimilarService  {
    func fetchSiamilarMovies(genreId: Int) async throws -> DiscoverModel
}


class SimilarServiceImplement: SimilarService {
    
    private let apiClient = APIClient()
    
    func fetchSiamilarMovies(genreId: Int) async throws -> DiscoverModel {
        let similarData = try await apiClient.request(urlString: .similarMovies(genreId), method: .get, type: DiscoverModel.self)
        return similarData
    }
    

}
