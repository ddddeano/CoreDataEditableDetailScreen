//
//  SandBoxApp.swift
//  SandBox
//
//  Created by Daniel Watson on 06/09/2021.
//

import SwiftUI
import CoreData

@main
struct SandBoxApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var dataModel = IngredientDataModel()

    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dataModel)
        }
        .onChange(of: scenePhase) { _ in
            try? pC.viewContext.save()
        }
    }
}
    var pC: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SandBox")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }()
    func saveContext() {
        let context = pC.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
