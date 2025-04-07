//
//  TaskListView.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject private var viewModel: TaskListViewModel
    
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
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: TaskAddView())
            }
        }
    }
    
    // MARK: - Private Views
    
    private var taskListContent: some View {
        List {
            ForEach(viewModel.tasks) { task in
                TaskRowView(task: task)
                    .onTapGesture {
                        withAnimation {
                            viewModel.toggleTaskCompletion(task: task)
                        }
                    }
            }
            .onDelete(perform: viewModel.deleteTask)
            .onMove(perform: viewModel.moveTask)
        }
        .listStyle(.plain)
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        TaskListView()
            .environmentObject(TaskListViewModel())
    }
}
