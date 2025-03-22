//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 28/05/2024.
//

import Foundation


@MainActor class MoviesViewModel: ObservableObject {
    
    @Published private(set) var discoverMoviesList: [DiscoverResults] = []
    @Published private(set) var upComingList: [UpComingResults] = []
    @Published var isLoading: Bool = false
    
    private let moviesUseCase: GetMoviesUseCaseProtocol
    private let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    private let iMDBBaseURl = "https://www.imdb.com/title/"
    private let imdbActorURL = "https://www.imdb.com/name/"
    private var currentPage = 1
    private var totalPages: Int = 1
    
    init(getMoviesUseCase: GetMoviesUseCase) {
        self.moviesUseCase = getMoviesUseCase
    }
    
    var imageDomainUrl: String {
        return imageBaseUrl
    }
    
    var baseIMDBURL: String {
        return iMDBBaseURl
    }
    
    var baseActorURl: String {
        return imdbActorURL
    }
    

    
    func fetchDiscoverMovies() async {
        do {
            currentPage += 1
            let discoverData = try await moviesUseCase.excuteDiscoverMovies(page: currentPage)
            discoverMoviesList.append(contentsOf: discoverData.results)
            totalPages = discoverData.totalPages
        }catch {
            print("Error in fetching discover Movies")
        }
    }
    
    
    func fetchUpComingMovies() async {
     
        do {
            currentPage += 1
            let upComingData = try await moviesUseCase.excuteUpcomingMovie(page: currentPage)
            upComingList.append(contentsOf: upComingData.results)
            totalPages = upComingData.totalPages
        }catch {
            print("Error in fetching upComing Movies")
        }
    }
    
    func handleRefresh() {
        upComingList.removeAll()
        currentPage = 0
        loadData()
    }
    
    func loadData() {
        Task(priority: .medium){
             await fetchUpComingMovies()
        }
    }
    

}
