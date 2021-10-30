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
                        .bold()
                        .font(.largeTitle)
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
                                Text(r.name)
                                    .foregroundColor(.black)
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
