//
//  DataController.swift
//  MoviesApp
//
//  Created by Sherif Samy on 15/05/2024.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Movie")
    
    init() {
        container.loadPersistentStores { Description, error in
            if let error = error {
                print("Can not load data \(error.localizedDescription)")
            }
        }
    }
}
