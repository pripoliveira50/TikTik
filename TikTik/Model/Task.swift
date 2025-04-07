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
    let priority: TaskPriority
    let createdAt: Date
    
    init(
        id: String = UUID().uuidString,
        title: String,
        isCompleted: Bool = false,
        priority: TaskPriority = .medium,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
        self.createdAt = createdAt
    }
    
    func toggleCompletion() -> Task {
        Task(
            id: id,
            title: title,
            isCompleted: !isCompleted,
            priority: priority,
            createdAt: createdAt
        )
    }
    
    func updatePriority(_ newPriority: TaskPriority) -> Task {
        Task(
            id: id,
            title: title,
            isCompleted: isCompleted,
            priority: newPriority,
            createdAt: createdAt
        )
    }
}
