//
//  APIClient.swift
//  MoviesApp
//
//  Created by Sherif Samy on 22/05/2024.
//

import Foundation


final class APIClient: NetworkingManagerProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
     self.init(configuration: .default)
    }
    
}



