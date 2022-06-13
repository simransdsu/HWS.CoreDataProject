//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Simran Preet Narang on 2022-06-13.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataControllerr = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataControllerr.container.viewContext)
        }
    }
}
