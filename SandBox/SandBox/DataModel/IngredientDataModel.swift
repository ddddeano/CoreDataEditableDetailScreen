//
//  IngredientDataModel.swift
//  SandBox
//
//  Created by Daniel Watson on 06/09/2021.
//

import Foundation
import SwiftUI
import CoreData

class IngredientDataModel: ObservableObject {
    
    let moc = pC.viewContext
    
    @Published var ingredients = [Ingredient]()
    
    init() {
        self.ingredients = fetch()
    }
    
    func fetch() -> [Ingredient] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Ingredient")
        let ingredients = try! moc.fetch(request) as?
            [Ingredient] ?? [Ingredient]()
        return ingredients
    }
    
    func add(_ text: String) {
        let ingredient = Ingredient(context: moc)
        ingredient.id = UUID()
        ingredient.name = text
        try? moc.save()
        self.ingredients = fetch()
    }
    func changeName(_ ingredient: Ingredient,_ name: String) {
        ingredient.name = name
        try? moc.save()
        self.ingredients = fetch()
    }
}
