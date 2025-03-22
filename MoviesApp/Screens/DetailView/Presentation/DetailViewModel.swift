//
//  DetailViewModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 29/05/2024.
//

import Foundation



@MainActor class DetailViewModel: ObservableObject {
    
    
    @Published private(set) var movieDetails: DetailsModel?
    @Published private(set) var personDetails: ActorDetails?
    @Published private(set) var creditsList: [Cast] = []
    @Published private(set) var listOfMoviesForPerson: [CreditCast] = []
    @Published var isLoading: Bool = false
    
    private let useCase: DetailsUseCaseProtocol
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
    
    init(useCase: DetailsUseCaseProtocol) {
        self.useCase = useCase
    }
    
    
    func fetchMovieDetails(movieId: Int) async {
        do {
            let movieSetails = try await useCase.excuteMovieDetails(movieId: movieId)
             movieDetails = movieSetails
        }catch {
            print("Error in fetching Details")
        }
    }
    
    
    func fetchCredits(movieId: Int) async {
        do{
            let creditData = try await useCase.excuteCredit(movieId: movieId)
          //  creditsList.append(contentsOf: creditData.cast )
            creditsList = creditData.cast
           // print(creditsList)
            
        }catch {
            print("Error in fetching Credit Details")
        }
    }
    
    
    func fetchPersonInformation(PersonId: Int) async {
        do {
            let personalData = try await useCase.excutePersonalDetails(personId: PersonId)
            personDetails = personalData
        }catch {
            print("Error in fetching personal Details")
        }
    }
    
    func getMoviesForPerson(personId: Int) async {
        do {
            let personMoviesData = try await useCase.excutePersonMovies(personId: personId)
            listOfMoviesForPerson = personMoviesData.cast ?? []
        }catch {
            print("Error in fetching Movies For Person ")
        }
    }
    
}
