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
    @State private var selectedPriority: TaskPriority? = nil
    @State private var showValidationAlert = false
    @State private var validationMessage = ""
    
    // MARK: - Computed Properties
    
    private var isTaskTitleValid: Bool {
        taskTitle.count >= 3
    }
    
    private var isPrioritySelected: Bool {
        selectedPriority != nil
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                subtitleSection
                
                taskTitleField
                
                PrioritySelectionView(selectedPriority: $selectedPriority)
                
                saveButton
            }
            .padding(.horizontal, 16)
            .padding(.top, 0)
        }
        .navigationTitle("Add Task")
        .background(Color(UIColor.systemGroupedBackground))
        .alert(isPresented: $showValidationAlert) {
            Alert(title: Text(validationMessage))
        }
    }
    
    // MARK: - Private Views
    
    private var subtitleSection: some View {
        Text("Fill in the details below")
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .padding(.top, 4)
            .padding(.bottom, 8)
    }
    
    private var taskTitleField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Task Title")
                .font(.headline)
            
            TextField("Ex: Buy milk", text: $taskTitle)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
    
    private var saveButton: some View {
        Button(action: attemptToSaveTask) {
            Text("Save Task")
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(.top, 16)
        }
    }
    
    // MARK: - Private Methods
    
    private func attemptToSaveTask() {
        if !isTaskTitleValid {
            validationMessage = "Your task must have at least 3 characters!"
            showValidationAlert = true
            return
        }
        
        if !isPrioritySelected {
            validationMessage = "Please select a priority for your task!"
            showValidationAlert = true
            return
        }
        
        // If we got here, both validations passed
        viewModel.addTask(withTitle: taskTitle, priority: selectedPriority!)
        dismiss()
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        TaskAddView()
            .environmentObject(TaskListViewModel())
    }
}
