//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/19/21.
//

import SwiftUI
struct RecipeTabView: View {
    var body: some View {
        
        TabView{
            RecipeFeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                            .font(Font.custom("Avenir Book", size: 20))
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                            .font(Font.custom("Avenir Book", size: 20))
                    }
                }
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
