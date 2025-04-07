//
//  TaskListView.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject private var viewModel: TaskListViewModel
    @State private var sortByPriority = true
    
    var pendingTasks: [Task] {
        let filtered = viewModel.tasks.filter { !$0.isCompleted }
        if sortByPriority {
            return filtered.sorted { priorityValue($0.priority) > priorityValue($1.priority) }
        } else {
            return filtered
        }
    }
    
    var completedTasks: [Task] {
        let filtered = viewModel.tasks.filter { $0.isCompleted }
        if sortByPriority {
            return filtered.sorted { priorityValue($0.priority) > priorityValue($1.priority) }
        } else {
            return filtered
        }
    }
    
    private func priorityValue(_ priority: TaskPriority) -> Int {
        switch priority {
        case .high:
            return 3
        case .medium:
            return 2
        case .low:
            return 1
        }
    }
    
    var body: some View {
        ZStack {
            if viewModel.hasNoTasks() {
                EmptyStateView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                taskListContent
            }
        }
        .navigationTitle("Task List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
                    .disabled(viewModel.hasNoTasks())
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    withAnimation {
                        sortByPriority.toggle()
                    }
                }) {
                    Label("", systemImage: "arrow.up.arrow.down")
                }
                .disabled(viewModel.hasNoTasks())
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: TaskAddView())
            }
        }
    }
    
    // MARK: - Private Views
    
    private var taskListContent: some View {
        List {
            if !pendingTasks.isEmpty {
                Section(header: Text("Pending")) {
                    ForEach(pendingTasks) { task in
                        TaskRowView(task: task)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.toggleTaskCompletion(task: task)
                                }
                            }
                    }
                    .onDelete { indexSet in
                        deleteTask(at: indexSet, from: pendingTasks)
                    }
                }
            }
            
            if !completedTasks.isEmpty {
                Section(header: Text("Completed")) {
                    ForEach(completedTasks) { task in
                        TaskRowView(task: task)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.toggleTaskCompletion(task: task)
                                }
                            }
                    }
                    .onDelete { indexSet in
                        deleteTask(at: indexSet, from: completedTasks)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
    
    private func deleteTask(at indexSet: IndexSet, from tasks: [Task]) {
        let idsToDelete = indexSet.map { tasks[$0].id }
        
        let indexesToDelete = viewModel.tasks.indices.filter { index in
            idsToDelete.contains(viewModel.tasks[index].id)
        }
        
        viewModel.deleteTask(at: IndexSet(indexesToDelete))
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        TaskListView()
            .environmentObject(TaskListViewModel())
    }
}
