//
//  Task.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//
import Foundation

struct Task: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleCompletion() -> Task {
        Task(id: id, title: title, isCompleted: !isCompleted)
    }
}
