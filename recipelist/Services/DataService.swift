//
//  DataService.swift
//  recipelist
//
//  Created by daniel westlund on 2/25/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe]{
        // parse local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
        
            // decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                // return the recipe
                return recipeData
            }
            
            catch{
                print(error)
            }
            
            
            
        } catch {
            print(error)
        }
        
        return [Recipe]()
    }
}
