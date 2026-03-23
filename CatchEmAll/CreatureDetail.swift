//
//  CreatureDetail.swift
//  CatchEmAll
//
//  Created by Louise Verbeke on 23/03/2026.
//

import Foundation


@Observable // Will watch objects for changes so that SwiftUI will redraw the interface when needed
class CreatureDetail {
    private struct Returned: Codable {
        var height: Double
        var weight: Double
        var sprites: Sprite
    }
    
    struct Sprite: Codable {
        var front_default: String
    }
    
    var urlString = "" // Update with string passed in from creature clicked on
    var height = 0.0
    var weight = 0.0
    var ImageURL = ""
    
    func getData() async {
        print("🕸️ We are accessing the url \(urlString)")
        
        // Create a url
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Tryto decode JSON data into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                return
            }
            self.height = returned.height
            self.weight = returned.weight
            self.ImageURL = returned.sprites.front_default
        } catch {
            print("😡 ERROR: Could not get data from \(urlString)")
        }
    }
}

