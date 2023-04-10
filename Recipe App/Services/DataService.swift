//
//  DataService.swift
//  Recipe App
//
//  Created by Dave Smyth on 4/8/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get a URL path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode data with JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add thr unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
            
        }
        catch {
            print(error)
        }
        
        return [Recipe]()

    }
    
}
