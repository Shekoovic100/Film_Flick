//
//  CreditsModel.swift
//  MoviesApp
//
//  Created by Sherif Samy on 20/05/2024.
//

import Foundation


struct CreditsModel: Codable {
    let id: Int
    let cast, crew: [Cast]
}

struct Cast: Codable, Identifiable, Hashable {

    let adult: Bool
    let gender, id: Int?
    let knownForDepartment, name, originalName: String?
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character, creditID: String?
    let order: Int?
    let department, job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
    
     init(adult: Bool, gender: Int? = nil, id: Int? = nil, knownForDepartment: String? = nil, name: String? = nil, originalName: String? = nil, popularity: Double, profilePath: String? = nil, castID: Int? = nil, character: String? = nil, creditID: String? = nil, order: Int? = nil, department: String? = nil, job: String? = nil) {
        self.adult = adult
        self.gender = gender
        self.id = id
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.castID = castID
        self.character = character
        self.creditID = creditID
        self.order = order
        self.department = department
        self.job = job
    }
    
}
