//
//  TopRatedViewModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


@MainActor class TopRatedViewModel: ObservableObject {
    
    
    @Published private(set) var topRatedList: [TopRatedResults] = []
    
    private let topRatedUseCase: TopRatedUseCaseProtocol
    private let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    private let iMDBBaseURl = "https://www.imdb.com/title/"
    private let imdbActorURL = "https://www.imdb.com/name/"
    
    private var currentPage = 1
    private var totalPages = 1
    
    var imageDomainUrl: String {
        return imageBaseUrl
    }
    var baseIMDBURL: String {
        return iMDBBaseURl
    }
    var baseActorURl: String {
        return imdbActorURL
    }
    
    
    init(useCase: TopRatedUseCaseProtocol) {
        self.topRatedUseCase = useCase
    }
    
    func getTopRatedList() -> [TopRatedResults] {
        return topRatedList
    }
    
  
    
    func getTopRatedMovies() async  {
        do {
            currentPage += 1
            let topRatedData = try await topRatedUseCase.excuteTopRated(page: currentPage)
            topRatedList.append(contentsOf: topRatedData.results)
            totalPages = topRatedData.totalPages
        }catch {
            print("Error in Fetching Data")
        }
    }
    
    func loadData() {
        Task(priority: .medium){
             await getTopRatedMovies()
        }
    }
    
}
