//
//  FoodMenuApp.swift
//  FoodMenu
//
//  Created by Abdullah Karaboğa on 21.01.2023.
//

import SwiftUI

@main
struct FoodMenuApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
