//
//  RecipeHighlights.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/30/21.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights:String = ""
    
    init(hightLights:[String]){
        
        //Loop for every string on the array
        for index in 0..<hightLights.count {
            
            if index == hightLights.count-1{
                allHighlights += hightLights[index]
            } else {
                allHighlights += hightLights[index] + ", "
            }
            
        }
        
    }
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir Book", size: 18))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(hightLights: ["Test1", "Test2", "Test3"])
    }
}
