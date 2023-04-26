//
//  ContentView.swift
//  recipelist
//
//  Created by daniel westlund on 2/25/23.
//

import SwiftUI

struct RecipeListView: View {
       
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack(spacing: 1.0) {
                            Image(r.image).resizable()
                                .scaledToFill()
                                .frame(width: 50, height:50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                    })
                
                

                
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
