//
//  ContentView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 07/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var movieListViewModel: MoviesViewModel
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    private var adptiveFixedColumns = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
 
    @State private var selection = 0
   
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical) {
                    Section {
                        SliderView()
                    }header: {
                        Text("Discover")
                            .font(.title.bold())
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding()
                    }
                    .frame(alignment: .top)
                        LazyVGrid(columns: adptiveFixedColumns,pinnedViews: .sectionHeaders) {
                            Section {
                                ForEach(Array(movieListViewModel.upComingList.enumerated()),id: \.offset) { index,movie in
                                    NavigationLink(destination: DetailView(movieId: movie.id)) {
                                        UpComingCellRow(movie: movie)
                                            .onAppear {
                                                if movie.id == movieListViewModel.upComingList.last?.id {
                                                    movieListViewModel.loadData()
                                                }
                                            }
                                    }
                                }
                            }header: {
                                Text("Upcoming")
                                    .font(.title.bold())
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding()
                            }
                        }
                .navigationTitle("Film Flick")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundStyle(.primary)
                .task {
                    await movieListViewModel.fetchDiscoverMovies()
                    await movieListViewModel.fetchUpComingMovies()
                }
                .environmentObject(movieListViewModel)
            }
            .frame(maxWidth: .infinity)
        }
    }
    

    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        let movieService = MovieServicesImplement()
        let movieRepository = MovieRepository(movieService: movieService)
        let getMoviesUseCase = GetMoviesUseCase(repository: movieRepository)
        let movieListViewModel = MoviesViewModel(getMoviesUseCase: getMoviesUseCase)
        
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(movieListViewModel)
    }
}


