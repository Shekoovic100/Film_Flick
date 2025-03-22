//
// MoviesAppApp.swift
//  MoviesApp
//
//  Created by Sherif Samy on 07/05/2024.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            
            let movieService = MovieServicesImplement()
            let movieRepository = MovieRepository(movieService: movieService)
            let getMoviesUseCase = GetMoviesUseCase(repository: movieRepository)
            let movieListViewModel = MoviesViewModel(getMoviesUseCase: getMoviesUseCase)
            
            let service = GenreService()
            let genreRepository = GenreRepository(service: service)
            let getGenreUseCase = GenreListUseCase(repository: genreRepository)
            let genreListViewModel = GenreViewModel(genreUseCase: getGenreUseCase)
            
            let topRatedService = TopRatedServiceImplement()
            let topRatedRepository = TopRatedRepository(service: topRatedService)
            let topRatedUseCase = TopRatedUseCase(repository: topRatedRepository)
            let topRatedViewModel = TopRatedViewModel(useCase: topRatedUseCase)
            
            let detailsDervice = DetailService()
            let detailsRepository = DetailsRepository(service: detailsDervice)
            let detailsUseCase = DetailsUseCase(repository: detailsRepository)
            let detailsViewModel = DetailViewModel(useCase: detailsUseCase)
            
            let getSimilarService = SimilarServiceImplement()
            let SimilarRepository = SimilarRepository(service: getSimilarService)
            let getSimilarUseCase = SimilarUseCase(repository: SimilarRepository)
            let similarListViewModel = SimilarViewModel(useCase: getSimilarUseCase)
            
          MainView()
                .environment(\.colorScheme, .dark)
                .environment(\.managedObjectContext,dataController.container.viewContext)
                .environmentObject(movieListViewModel)
                .environmentObject(genreListViewModel)
                .environmentObject(topRatedViewModel)
                .environmentObject(detailsViewModel)
                .environmentObject(similarListViewModel)
        }
    }
}
