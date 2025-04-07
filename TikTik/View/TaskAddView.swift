//
//  TaskAddView.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

struct TaskAddView: View {
    
    // MARK: - Properties
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: TaskListViewModel
    
    @State private var taskTitle = ""
    @State private var showValidationAlert = false
    @State private var validationMessage = ""
    
    // MARK: - Computed Properties
    
    private var isTaskTitleValid: Bool {
        taskTitle.count >= 3
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                taskTitleField
                saveButton
            }
            .padding(14)
        }
        .navigationTitle("Add a Task 🖊️")
        .alert(isPresented: $showValidationAlert) {
            Alert(title: Text(validationMessage))
        }
    }
    
    // MARK: - Private Views
    
    private var taskTitleField: some View {
        TextField("Type task description here...", text: $taskTitle)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
    }
    
    private var saveButton: some View {
        Button(action: attemptToSaveTask) {
            Text("Save".uppercased())
                .foregroundStyle(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
    }
    
    // MARK: - Private Methods
    
    private func attemptToSaveTask() {
        if isTaskTitleValid {
            viewModel.addTask(withTitle: taskTitle)
            dismiss()
        } else {
            validationMessage = "Your task must be at least 3 characters long!"
            showValidationAlert = true
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        TaskAddView()
            .environmentObject(TaskListViewModel())
    }
}
