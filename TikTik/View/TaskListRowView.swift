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
            taskTitle
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
    
    // MARK: - Private Views
    
    private var statusIcon: some View {
        Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
            .foregroundStyle(task.isCompleted ? .green : .yellow)
    }
    
    private var taskTitle: some View {
        Text(task.title)
    }
}

// MARK: - Preview
#Preview {
    let sampleTask = Task(title: "Complete refactoring", isCompleted: false)
    return TaskRowView(task: sampleTask)
}
