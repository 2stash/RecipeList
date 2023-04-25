//
//  RecipeModel.swift
//  recipelist
//
//  Created by daniel westlund on 2/25/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()

    init(){
        self.recipes = DataService.getLocalData()
    }

}
