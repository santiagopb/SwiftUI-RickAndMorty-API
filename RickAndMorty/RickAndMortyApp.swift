//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    let dependencies = Dependencies()
    
    var body: some Scene {
        WindowGroup {
            CharacterListView()
        }
    }
}
