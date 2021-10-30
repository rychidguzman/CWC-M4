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
    
    
    static func getServing(ingredient:Ingredient, recipeServing:Int, targetServing:Int) -> String {
        
        var portions:String = ""
        var numerator:Int = ingredient.num ?? 1
        var denominator:Int = ingredient.denom ?? 1
        var wholePortions:Int = 0
        if ingredient.num != nil {
            //Get a single serving size by multiplying denominator by the recipe serving
            denominator *= recipeServing
            
            //Get target portion by multiplying numerator to target serving
            numerator *= targetServing
            //Reduce fraction by greatest common factor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                wholePortions = numerator / denominator
                
                numerator = numerator % denominator
                
                portions += String(wholePortions)
            }
            
            if numerator > 0 {
               
                //Express the remainder as fraction
                portions += wholePortions > 0 ? " " : ""
                portions += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
                
            }
            portions += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portions + unit
        }
        
        return portions
    }
}
