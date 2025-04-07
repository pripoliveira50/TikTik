//
//  TikTikApp.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

@main
struct TikTikApp: App {
    
    @StateObject private var taskListViewModel: TaskListViewModel = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(taskListViewModel)
        }
    }
}
