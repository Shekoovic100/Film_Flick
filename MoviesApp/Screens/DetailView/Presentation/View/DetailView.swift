//
//  DetailView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 07/05/2024.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var detailViewModel: DetailViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var mangedObjectContext
    @State private var favouriteIsClicked = false
    
    let movieId: Int
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if let movieDetails = detailViewModel.movieDetails {
                    VStack {
                        VStack {
                            CashedImageView(imageUrlString: detailViewModel.imageDomainUrl + (movieDetails.backdropPath ?? ""),width: 400, height: 270)
                        }
                     
                        
                        MovieInformationView(movieDetails: movieDetails)
                        
                        YellowButton(title: "Watch Trailer", url: URL(string: detailViewModel.baseIMDBURL + (detailViewModel.movieDetails?.imdbID ?? ""))!) {
                            
                        }
                        
                        Section() {
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(alignment: .top,spacing: 10) {
                                    ForEach(Array(detailViewModel.creditsList.enumerated()),id: \.offset) { index , cast in
                                        NavigationLink {
                                            CreditsDetailView(actorDetailsId: cast.id ?? 0)
                                        } label: {
                                            VStack {
                                                CreditsRowView(movie: cast)
                                            }
                                        }
                                    }
                                }
                            }
                        }header: {
                            VStack {
                                Text("Cast")
                                    .font(.title.bold())
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
            .navigationTitle("Movie Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        favouriteIsClicked.toggle()
                        let movie = Movie(context: mangedObjectContext)
                        movie.id = UUID()
                        movie.title = detailViewModel.movieDetails?.title
                        movie.posterPath = detailViewModel.movieDetails?.posterPath
                        movie.details = detailViewModel.movieDetails?.overview
                        try? mangedObjectContext.save()
                    }) {
                        Image(systemName: favouriteIsClicked ? "heart.fill" : "heart")
                            .foregroundColor(favouriteIsClicked ? .red : .gray)
                        
                            .alert("Saved to your List", isPresented: $favouriteIsClicked) {
                                Button("OK",role:.cancel) {
                                    dismiss()
                                }
                            }
                    }
                }
            }
            .task {
                //  await viewModel.getMovieDetails(movieId: movieId)
                //  await viewModel.fetcCredits(movieId: movieId)
                await detailViewModel.fetchMovieDetails(movieId: movieId)
                await detailViewModel.fetchCredits(movieId: movieId)
            }
            .environmentObject(detailViewModel)
        }
    }
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let detailsDervice = DetailService()
        let detailsRepository = DetailsRepository(service: detailsDervice)
        let detailsUseCase = DetailsUseCase(repository: detailsRepository)
        let detailsViewModel = DetailViewModel(useCase: detailsUseCase)
        
        DetailView(movieId:  653346)
            .preferredColorScheme(.dark)
            .environmentObject(detailsViewModel)
    }
}

//#Preview {
//    DetailView(movieId:  653346)
//        .preferredColorScheme(.dark)
//}
