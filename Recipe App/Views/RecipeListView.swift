//
//  ContentView.swift
//  Recipe App
//
//  Created by Dave Smyth on 4/8/23.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { r in
                NavigationLink(destination: RecipeDetailView(recipe: r)) {
                    HStack {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                        Text(r.name)
                            .foregroundStyle(.primary)
                    }
                }
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
