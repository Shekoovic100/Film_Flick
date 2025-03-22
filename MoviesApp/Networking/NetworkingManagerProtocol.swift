//
//  NetworkingManagerProtocol.swift
//  MoviesApp
//
//  Created by Sherif Samy on 22/05/2024.
//

import Foundation


public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol NetworkingManagerProtocol {
    var  session: URLSession { get }
    func request<T: Codable>(urlString: Route, method: HTTPMethod,type: T.Type) async throws -> T
}


extension NetworkingManagerProtocol {
    
    
    func request<T: Codable>(urlString: Route, method: HTTPMethod,type: T.Type) async throws -> T {
        
        let movieURL = Route.BaseURL + urlString.description
        guard let url = URL(string: movieURL) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let (data , response) = try await session.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw APIError.requestFailed(description: "Inavild Response")
        }
        
        guard  response.statusCode == 200 else {
            throw APIError.responseUnsuccessful(description: "StatusCode: \(response.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
            
        } catch {
            throw APIError.jsonConversionFailure(description: error.localizedDescription)
        }
    }
}


//MARK: - Using Completion

extension NetworkingManagerProtocol {
    
    func request<T: Codable>(urlString: Route, method: HTTPMethod, type: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let movieURL = Route.BaseURL + urlString.description
        guard let url = URL(string: movieURL) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(APIError.requestFailed(description: error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(APIError.requestFailed(description: "Invalid Response")))
                return
            }
            
            guard response.statusCode == 200 else {
                completion(.failure(APIError.responseUnsuccessful(description: "StatusCode: \(response.statusCode)")))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.requestFailed(description: "No Data")))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedObject = try decoder.decode(type, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(APIError.jsonConversionFailure(description: error.localizedDescription)))
            }
        }.resume()
    }
}
