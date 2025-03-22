//
//  SimilarViewModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 04/06/2024.
//

import Foundation


@MainActor class SimilarViewModel: ObservableObject {
    
    @Published private(set) var similarList: [DiscoverResults] = []
    
    private let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    private let iMDBBaseURl = "https://www.imdb.com/title/"
    private let imdbActorURL = "https://www.imdb.com/name/"
    private let useCase: SimilarUseCaseProtocol
    
    
    
    var imageDomainUrl: String {
        return imageBaseUrl
    }
    var baseIMDBURL: String {
        return iMDBBaseURl
    }
    var baseActorURl: String {
        return imdbActorURL
    }
    
    
    init(useCase: SimilarUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getAllSimilarListMovies(genreId: Int) async {
        
        do {
            let similarData = try await useCase.fetchSimilarMoviesList(genreId: genreId)
            similarList.append(contentsOf: similarData.results)
        }catch {
            print("Error in similar Movies List ")
        }
        
    }
    
}
