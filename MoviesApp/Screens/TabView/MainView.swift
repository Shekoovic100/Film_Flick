//
//  MainView.swift
//  MoviesApp
//
//  Created by Sherif Samy on 08/05/2024.
//

import SwiftUI

struct MainView: View {
  
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                HomeView()
                    .tabItem {
                        Label("Discover", systemImage: "house.fill")
                    }
                    .tint(.yellow)
                    .tag(0)
                
                TopRated()
                    .tabItem {
                        Label("Top Rated", systemImage: "star.fill")
                    }
                    .tag(1)
                GenresView()
                    .tabItem {
                        Label("Genres", systemImage: "magnifyingglass")
                    }
                    .tag(2)
                Favourites()
                    .tabItem {
                        Label("Wishlist", systemImage: "heart.fill")
                    }
                    .tag(3)
            }
            .tint(.yellow)
            .toolbarBackground(Color.theme.background, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            
        }
    }
}

