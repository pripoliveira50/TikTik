//
//  TaskListRowView.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

struct TaskRowView: View {
    
    let task: Task
    
    var body: some View {
        HStack {
            statusIcon
            
            Text(task.title)
                .font(.title3)
            
            Spacer()
            
            HStack(spacing: 4) {
                Image(systemName: task.priority.icon)
                    .foregroundStyle(task.priority.color)
                
                Text(task.priority.name)
                    .font(.caption)
                    .foregroundStyle(task.priority.color)
            }
        }
        .padding(.vertical, 8)
    }
    
    // MARK: - Private Views
    
    private var statusIcon: some View {
        Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
            .foregroundStyle(task.isCompleted ? .green : .yellow)
            .font(.title2)
            .padding(.trailing, 8)
    }
}

// MARK: - Preview
#Preview {
    let sampleTask = Task(title: "Complete refactoring", priority: .high)
    return TaskRowView(task: sampleTask)
}
