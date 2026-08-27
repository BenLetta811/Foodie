//
//  FoodieApp.swift
//  Foodie
//
//  Created by Benjamin Letta on 4/25/26.
//

import SwiftUI
import SwiftData

@main
struct FoodieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FoodLogItem.self)
    }
}
