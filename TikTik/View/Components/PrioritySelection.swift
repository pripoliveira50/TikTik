//
//  PrioritySelection.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

struct PrioritySelectionView: View {
    @Binding var selectedPriority: TaskPriority?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Priority")
                .font(.headline)
                .padding(.bottom, 5)
            
            HStack(spacing: 16) {
                ForEach(TaskPriority.allCases) { priority in
                    PriorityButton(
                        priority: priority,
                        isSelected: selectedPriority == priority,
                        action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                if selectedPriority == priority {
                                    selectedPriority = nil
                                } else {
                                    selectedPriority = priority
                                }
                            }
                        }
                    )
                }
            }
        }
    }
}

struct PriorityButton: View {
    let priority: TaskPriority
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: priority.icon)
                    .font(.title2)
                Text(priority.name)
                    .font(.caption)
            }
            .foregroundStyle(isSelected ? .white : priority.color)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? priority.color : Color(UIColor.tertiarySystemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(priority.color, lineWidth: isSelected ? 0 : 2)
            )
        }
    }
}

// Extension needed for task model with optional priority
extension TaskPriority {
    static func englishName(for priority: TaskPriority?) -> String {
        guard let priority = priority else {
            return "None"
        }
        
        switch priority {
        case .high:
            return "High"
        case .medium:
            return "Medium"
        case .low:
            return "Low"
        }
    }
}

#Preview {
    VStack {
        PrioritySelectionView(selectedPriority: .constant(nil))
            .padding()
            .background(Color(UIColor.systemBackground))
    }
}
