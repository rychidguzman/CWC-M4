//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/12/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    var body: some View {
        
        ScrollView {
            
            // MARK: Recipe Image
            Image(recipe.image)
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading){
                
                VStack(alignment: .leading) {
                    // MARK: Ingredients
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    ForEach (recipe.ingredients) { index in
                        Text("• " + index.name)
                    }
                    
                    // MARK: Divider
                    
                    Divider()
                    
                }
                VStack(alignment: .leading){
                    // MARK: Directions
                    Text("Direction")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                    ForEach(0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 1.0)
                    }
                    
                
            }
            }
            .padding(.horizontal)
            
            
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it in to the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
