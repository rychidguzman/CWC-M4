//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/11/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes:[Recipe] = [Recipe]()
    
    init() {
        // Create an instane of data service ad get data
        self.recipes = DataService.getLocalData()
    }
}
