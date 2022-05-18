//
//  flexible_pomodoroApp.swift
//  flexible_pomodoro
//
//  Created by taekkim on 2022/04/29.
//

import SwiftUI

@main
struct flexible_pomodoroApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
