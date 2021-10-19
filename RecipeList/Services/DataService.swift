//
//  DataService.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/11/21.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {

        //Parse local json file
        
        
        //Get a url to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if pathString is not nil otherwise....
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //Create a data object
            let data = try Data(contentsOf: url)
            
            //Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
           
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Add the unique ID's
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
                
            } catch {
                //print error parsing json
                print(error)
                
            }
            
        } catch {
            //print the error getting data
            print(error)
        }
        
        
        
        
        return [Recipe]()
    }
}
