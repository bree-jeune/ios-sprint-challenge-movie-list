//
//  MovieController.swift
//  Movie List
//
//  Created by Bree Jeune on 3/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    
    
    var movies: [Movie] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        

        return documents.appendingPathComponent("movie.plist")
    
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    // CRUD
    @discardableResult func addNewMovieToList(named name: String, seen hasBeenSeen:  Bool = false) -> Movie {
   
    let movie = Movie(name: name)
        movies.insert(movie, at: 0)
   saveToPersistentStore()
   return movie
   }
    
    func listMovies() -> String {
        var output = ""
        for movie in movies {
            output += "\(movie.name)"
        }
        return output
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(movies)
            try data.write(to: url)
        } catch {
            print("Error Saving Movie to List")
        }
    }
    
    func deleteFromPersistentStore(movie: Movie) {
            guard let index = movies.firstIndex(of: movie) else { return }
            movies.remove(at: index)
            saveToPersistentStore()
            
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            movies = try decoder.decode([Movie].self, from: data)
        } catch {
           print("Error Loading Movie List")
        }
    }
    
}
