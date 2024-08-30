//
//  ToDosApp.swift
//  ToDos
//
//  Created by Hemant on 30/08/24.
//

import SwiftUI
import SwiftData

@main
struct ToDosApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: ReminderList.self)
    }
}
