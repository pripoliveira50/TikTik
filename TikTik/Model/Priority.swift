//
//  Priority.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

enum TaskPriority: String, CaseIterable, Identifiable, Codable {
    case high = "high"
    case medium = "medium"
    case low = "low"
    
    var id: String { self.rawValue }
    
    var name: String {
        switch self {
        case .high:
            return "High"
        case .medium:
            return "Medium"
        case .low:
            return "Low"
        }
    }
    
    var color: Color {
        switch self {
        case .high:
            return .red
        case .medium:
            return .orange
        case .low:
            return .green
        }
    }
    
    var icon: String {
        switch self {
        case .high:
            return "exclamationmark.triangle"
        case .medium:
            return "equal.square"
        case .low:
            return "arrow.down.square"
        }
    }
}
