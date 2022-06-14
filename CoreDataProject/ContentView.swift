//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Simran Preet Narang on 2022-06-13.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name == 'Harrry Porter'")) var wizards: FetchedResults<WIzard>
    
    @State private var wizardName: String = ""
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
        }
        
        TextField("Enter a wized name", text: $wizardName)
        
        Button("Add") {
            let wizard = WIzard(context: moc)
            wizard.name = wizardName
            do {
                try moc.save()
            } catch {
                print(error.localizedDescription)
            }
            wizardName = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
