//
//  ContentView.swift
//  SandBox
//
//  Created by Daniel Watson on 06/09/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: IngredientDataModel
    
    @State var name = ""
    
    var body: some View {
        NavigationView {
        VStack {
            TextField("Ingredient Name", text: $name)
            Image(systemName: "plus")
                .onTapGesture {
                    dataModel.add(name)
                }
            ForEach(dataModel.ingredients, id:\.self) { ingredient in
                NavigationLink(
                    destination: IngredientDetailView(ingredient: ingredient)
                ) {
                    IngredientRowView(ingredient: ingredient)
                    }
                }
            }
        }
    }
}

struct IngredientDetailView: View {
    @EnvironmentObject var dataModel: IngredientDataModel
    var ingredient: Ingredient
    
    @State var name = ""
    
    var body: some View {
        VStack {
            TextField(ingredient.displayName, text: $name)
            Image(systemName: "pencil.circle")
                .onTapGesture {
                    dataModel.changeName(ingredient, name)
            }
        }
    }
}

struct IngredientRowView: View {
    var ingredient: Ingredient
    var body: some View {
        Text(ingredient.displayName)
    }
}

