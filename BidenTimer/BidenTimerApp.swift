//
//  BidenTimerApp.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/8/20.
//

import SwiftUI

@main
struct BidenTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
