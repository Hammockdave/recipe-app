//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Dave Smyth on 4/9/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading){
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    ForEach (0..<recipe.ingredients.count, id:\.self) { index in
                        Text(String(index + 1) + ". " + recipe.ingredients[index])
                    }
                }
                .padding(.horizontal, 10)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment:.leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom,.top], 5)
                    ForEach (recipe.directions, id: \.self) { item in
                        Text(item)
                            .padding(.bottom,5)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it to the detail view
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
