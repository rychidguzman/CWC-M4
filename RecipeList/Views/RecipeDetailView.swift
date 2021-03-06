//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/12/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var serving:Int = 2
    var body: some View {
        
        ScrollView {
            
            // MARK: Recipe Image
            Image(recipe.image)
                .resizable()
                .scaledToFill()
            
            //MARK: Serving
            VStack(alignment: .leading){
                Text(recipe.name)
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.bottom, 10)
                Text("Select your Serving:")
                    .font(Font.custom("Avenir Book", size: 17))
                Picker("", selection: $serving){
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .font(Font.custom("Avenir Book", size: 13))
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding([.leading, .trailing], 10)
            
            VStack(alignment: .leading){
                
                VStack(alignment: .leading) {
                    // MARK: Ingredients
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 18))
                        .padding(.bottom, 5.0)
                    ForEach (recipe.ingredients) { index in
                        Text("• " + RecipeModel.getServing(ingredient: index, recipeServing: recipe.servings, targetServing: serving) + " " + index.name.lowercased())
                            .font(Font.custom("Avenir Book", size: 16))
                    }
                    
                    // MARK: Divider
                    
                    Divider()
                    
                }
                VStack(alignment: .leading){
                    // MARK: Directions
                    Text("Direction")
                        .padding(.vertical, 5.0)
                        .font(Font.custom("Avenir Heavy", size: 18))
                    ForEach(0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 1.0)
                            .font(Font.custom("Avenir Book", size: 16))
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
            .environmentObject(RecipeModel())
    }
}
