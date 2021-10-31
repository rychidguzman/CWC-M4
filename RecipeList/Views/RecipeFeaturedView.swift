//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by Ryan Christian De Guzman on 10/20/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing:Bool = false
    @State var tabSelectionIndex:Int = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured Recipes")
                .bold()
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader{ geo in
                
                TabView(selection: $tabSelectionIndex){
                    
                    ForEach(0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            //Button for showing the detail view
                            Button {
                                isDetailViewShowing = true
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode:  .fill)
                                            .clipped()
                                        
                                        Text(model.recipes[index].name)
                                            .padding()
                                            .font(Font.custom("Avenir Book", size: 17))
                                        
                                    }
                                }
                            }
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing){
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -10, y: 10)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 18))
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(Font.custom("Avenir Heavy", size: 18))
                RecipeHighlights(hightLights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
            
        }
        .onAppear {
            setFeaturedIndex()
        }
        
        
    }
    
    func setFeaturedIndex() {
        
        //Find the first index of featured recipe
        var index = model.recipes.firstIndex { (recipes) -> Bool in return recipes.featured
        }
        
        tabSelectionIndex = index ?? 0
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
