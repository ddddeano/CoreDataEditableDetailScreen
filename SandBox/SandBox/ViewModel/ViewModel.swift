//
//  ViewModel.swift
//  SandBox
//
//  Created by Daniel Watson on 07/09/2021.
//

import Foundation

class IngredientsControl: ObservableObject {
    
    @Published var name = ""
    
    func add() -> String {
        return name
    }
    
    func read(_ data: [Ingredient]) -> [Ingredient] {
        return data
    }
}

class IngredientDetailViewModel: ObservableObject {
    
    var ingredient: Ingredient
    @Published var name = ""
    
    init(_ ingredient: Ingredient) {
        self.ingredient = ingredient
    }
    func change(text: String) -> (String, Ingredient) {
        return (name, ingredient)
    }
}
