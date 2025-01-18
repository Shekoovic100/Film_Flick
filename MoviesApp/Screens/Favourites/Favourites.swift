//
//  Favourites.swift
//  MoviesApp
//
//  Created by Sherif Samy on 15/05/2024.
//

import SwiftUI

struct Favourites: View {
    
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var viewModel: MoviesViewModel
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title , order: .forward)]) var movies: FetchedResults<Movie>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movies) { item in
                NavigationLink(destination: favouritesDetailView(item: item)) {
                 WishListRowView(imageUrl: viewModel.imageDomainUrl + (item.posterPath ?? ""), title: item.title ?? "")
                    }
                }
                .onDelete(perform: removeMovies)
            }
            .listRowBackground(Color.theme.background)
            .listRowSeparatorTint(.orange)
            .listStyle(.plain)
            .navigationTitle("Wishlist")
            .environmentObject(viewModel)
        }
    }
    
    func removeMovies(at offsets: IndexSet) {
        for index in offsets {
            let item = movies[index]
            moc.delete(item)
        }
        try? moc.save()
    }
}


