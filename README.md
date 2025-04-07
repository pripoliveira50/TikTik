# TikTik - Task Management App

TikTik is a simple, intuitive, yet powerful task management application built for iOS devices. Designed with modern SwiftUI principles, it gives users an elegant interface to efficiently create, organize, and track daily tasks. With features like priority-based organization, task completion tracking, and persistent storage, TikTik helps users stay productive and focused.

## 📋 Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Technologies Used](#technologies-used)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Design Decisions](#design-decisions)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [User Interface](#user-interface)
- [Future Improvements](#future-improvements)

## ✨ Features

- **Intuitive Task Management**: Create, complete, and delete tasks with a simple, elegant interface
- **Priority System**: Assign High, Medium, or Low priority to tasks with visual indicators
- **Task Organization**: View tasks sorted by priority and separated by completion status
- **Data Persistence**: Tasks are automatically saved to device storage
- **Responsive Design**: Optimized for various iOS devices and orientations
- **Empty State Handling**: Engaging animations and prompts when no tasks exist
- **Customizable Sorting**: Toggle between priority-based and creation-date ordering

## 📱 Screenshots

*[Screenshots to be inserted here]*

## 🛠️ Technologies Used

- **SwiftUI**: Framework for building user interfaces across all Apple platforms
- **Combine**: Framework for handling asynchronous events
- **UserDefaults**: For persistent local data storage
- **Swift 5.7+**: Modern Swift language features
- **MVVM Architecture**: For clean separation of concerns
- **Xcode 15**: Development environment

## 🏗️ Architecture

TikTik follows the **Model-View-ViewModel (MVVM)** architecture pattern, which provides several benefits:

- **Separation of Concerns**: Clear distinction between data, business logic, and UI
- **Testability**: ViewModels can be tested independently of the UI
- **Maintainability**: Code is organized into distinct layers with specific responsibilities
- **Reusability**: Components can be reused across different parts of the application

The application is structured into three main layers:

1. **Model Layer**: Defines the data structures (`Task`, `TaskPriority`)
2. **View Layer**: Handles UI elements and user interactions
3. **ViewModel Layer**: Manages business logic and serves as a bridge between Model and View

## 📁 Project Structure

```
TikTik/
├── App/
│   └── TikTikApp.swift        # Main app entry point
├── Model/
│   ├── Priority.swift         # Task priority enumeration
│   └── Task.swift             # Task data model
├── Utils/
│   └── JSONLoader.swift       # Utility for data persistence
├── View/
│   ├── Components/            # Reusable UI components
│   │   ├── PrioritySelection.swift
│   │   ├── EmptyStateView.swift
│   │   ├── TaskAddView.swift
│   │   ├── TaskListRowView.swift
│   │   └── TaskListView.swift
├── ViewModel/
│   └── TaskListViewModel.swift # Business logic for task management
└── Assets/                    # App resources
```

## 🧠 Design Decisions

### Immutable Data Models

The application uses immutable data structures for the `Task` model. This approach:
- Prevents unexpected state changes
- Ensures data consistency
- Makes the application more predictable
- Facilitates debugging

When modifications are needed, new instances are created with the desired changes via methods like `toggleCompletion()` and `updatePriority()`.

### Enum-based Priority System

The `TaskPriority` enum provides a type-safe way to handle task priorities with associated properties:
- Colors for visual distinction
- Icons for quick recognition
- Localized names for readability

This approach centralizes all priority-related information and makes adding new priority levels straightforward if needed.

### UserDefaults for Persistence

For a lightweight task app, UserDefaults provides:
- Simple implementation without complex database setup
- Automatic synchronization
- Quick load and save operations

The `JSONLoader` utility abstracts the serialization/deserialization process, making it easy to switch to a different storage mechanism in the future if needed.

### Section-based Task Grouping

Tasks are divided into "Pending" and "Completed" sections to:
- Provide visual separation between different states
- Allow users to focus on active tasks
- Keep a record of completed tasks for reference
- Improve the overall user experience

### MVVM Implementation

The ViewModel (`TaskListViewModel`) acts as the central component, keeping the views stateless and focused on presentation while:
- Managing the task collection
- Handling business logic
- Providing computed properties for filtered/sorted task lists
- Abstracting persistence operations from the view layer

## 📋 Prerequisites

- iOS 16.0+
- Xcode 15.0+
- Swift 5.7+
- macOS Ventura or later (for development)

## 🚀 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/username/TikTik.git
   ```

2. Open the project in Xcode:
   ```bash
   cd TikTik
   open TikTik.xcodeproj
   ```

3. Select your target device or simulator and run the app (⌘+R)

## 🎨 User Interface

TikTik features a clean, focused interface designed with these principles in mind:

### Minimalist Task List

- Simple task rows with completion status, title, and priority
- Clear visual indicators for task priorities using both colors and icons
- Tap to toggle completion status
- Swipe to delete tasks
- Edit mode for rearranging tasks

### Intuitive Task Creation

- Dedicated screen for adding tasks
- Simple form with validation
- Interactive priority selection with visual feedback
- Clear error messages for invalid inputs

### Empty State Experience

- Animated prompt to add the first task
- Encouraging message to get started
- Direct link to the task creation screen

### Organized Task Viewing

- Tasks grouped by completion status
- Priority-based sorting for easy focus
- Option to toggle between sorting methods

## 🔮 Future Improvements

- Task due dates and reminders
- Custom categories/tags for tasks
- Dark mode theme optimization
- iCloud synchronization across devices
- Widgets for home screen quick access
- Task sharing capabilities
- Recurring task support
- Statistics and productivity insights

---

  Made with ❤️ by [Priscila Oliveira](https://github.com/pripoliveira50/)
