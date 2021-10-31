//
//  ContentView.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/11/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        
        
        NavigationView {
            ScrollView{
                LazyVStack(alignment: .leading) {
                    Text("All Recipes")
                        .font(Font.custom("Avenir Heavy", size: 24))
                        .padding(.top, 40)
                    ForEach(model.recipes){ r in
                        NavigationLink {
                            RecipeDetailView(recipe: r)
                        } label: {
                            HStack(spacing: 20.0) {
                                Image(r.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipped()
                                    .cornerRadius(5.0)
                                VStack(alignment: .leading){
                                    Text(r.name)
                                        .font(Font.custom("Avenir Heavy", size: 16))
                                        .foregroundColor(.black)
                                    RecipeHighlights(hightLights: r.highlights)
                                        .foregroundColor(.black)
                                        .font(Font.custom("Avenir Book", size: 13))
                                }
                                
                                
                            }
                        }      
                    }.navigationBarHidden(true)
                }
                .padding(.leading)
            }
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
