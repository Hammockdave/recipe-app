//
//  RecipeModel.swift
//  Recipe App
//
//  Created by Dave Smyth on 4/8/23.
//

import Foundation

class RecipeModel:ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
}
