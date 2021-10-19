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
            Text("Featured View Coming Soon!")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        
        
        
        
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
