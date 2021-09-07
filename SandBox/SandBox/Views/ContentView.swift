//
//  ContentView.swift
//  SandBox
//
//  Created by Daniel Watson on 06/09/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: IngredientDataModel
    @StateObject var viewModel = IngredientsControl()
    
    @State var name = ""
    
    var body: some View {
        VStack {
            TextField("Ingredient Name", text: $name)
            Image(systemName: "plus")
                .onTapGesture {
                    dataModel.add(name)
                }
            ForEach(dataModel.ingredients, id:\.self) { ingredient in
                IngredientRowView(ingredient: ingredient).environmentObject(dataModel)
            }
        }
    }
}

struct IngredientDetailView: View {
    @EnvironmentObject var dataModel: IngredientDataModel
    @StateObject var viewModel: IngredientDetailViewModel
    
    var body: some View {
        VStack {
            TextField(viewModel.ingredient.displayName, text: $viewModel.name)
            Image(systemName: "pencil.circle")
                .onTapGesture {
                    dataModel.changeName(viewModel.ingredient, viewModel.name)
            }
        }
    }
}

struct IngredientRowView: View {
    @EnvironmentObject var dataModel: IngredientDataModel
    var ingredient: Ingredient
    var body: some View {
        NavigationLink(
            destination: IngredientDetailView(viewModel: IngredientDetailViewModel(ingredient)).environmentObject(dataModel)
        ) {
        Text(ingredient.displayName)
        }
    }
}
