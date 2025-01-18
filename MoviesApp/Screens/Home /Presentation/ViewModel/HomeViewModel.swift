//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 07/05/2024.
//

import Foundation


@MainActor class HomeViewModel: ObservableObject {
    
   // private let apiClient = APIClient()

    @Published var isLoading: Bool = false
    
    
    
    var totalPages = 0
    var page = 1
    var totalPagesUpcoming = 0
    
    private let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    private let iMDBBaseURl = "https://www.imdb.com/title/"
    private let imdbActorURL = "https://www.imdb.com/name/"
    
    
    var imageDomainUrl: String {
        return imageBaseUrl
    }
    var baseIMDBURL: String {
        return iMDBBaseURl
    }
    var baseActorURl: String {
        return imdbActorURL
    }
    
}

