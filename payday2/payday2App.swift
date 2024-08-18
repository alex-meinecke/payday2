//
//  payday2App.swift
//  payday2
//
//  Created by Meinecke, Alexander on 17.08.24.
//

import SwiftUI

@main
struct payday2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TripView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
