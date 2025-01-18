//
//  CreditsDetailView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 20/05/2024.
//

import SwiftUI

struct CreditsDetailView: View {
    
    @EnvironmentObject var detailViewModel: DetailViewModel
    var actorDetailsId: Int
   

    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
              CreditsView()
                
                Section() {
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(alignment: .top,spacing: 10) {
                            ForEach(Array(detailViewModel.listOfMoviesForPerson.enumerated()),id: \.offset) { index , cast in
                                NavigationLink {
                                    DetailView(movieId: cast.id ?? 0)
                                } label: {
                                    VStack {
                                        MoviesPersonRowView(movie: cast)
                                    }
                                }
                            }
                        }
                    }
                }header: {
                    VStack {
                        Text("Related Movies")
                            .font(.title.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .task {
                //await viewModel.fetchPersonInformation(personId: actorDetailsId)
                await detailViewModel.fetchPersonInformation(PersonId: actorDetailsId)
                await detailViewModel.getMoviesForPerson(personId: actorDetailsId)
            }
            .navigationTitle("Cast Details")
            .navigationBarTitleDisplayMode(.inline)
            .environmentObject(detailViewModel)
        }
       
    }
}



struct CreditsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let detailsDervice = DetailService()
        let detailsRepository = DetailsRepository(service: detailsDervice)
        let detailsUseCase = DetailsUseCase(repository: detailsRepository)
        let detailsViewModel = DetailViewModel(useCase: detailsUseCase)
        
        CreditsDetailView(actorDetailsId: 13240)
            .preferredColorScheme(.dark)
            .environmentObject(detailsViewModel)
    }
}





