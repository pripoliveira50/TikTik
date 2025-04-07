//
//  TaskListViewModel.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import Foundation

class TaskListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published private(set) var tasks: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    
    private let tasksStorageKey = "saved_tasks"
    
    // MARK: - Initialization
    
    init() {
        loadTasks()
    }
    
    // MARK: - Public Methods
    
    /// Loads all tasks from device storage
    func loadTasks() {
        if let savedTasks = JSONLoader.loadFromUserDefaults([Task].self, forKey: tasksStorageKey) {
            self.tasks = savedTasks
        }
    }
    
    /// Adds a new task with the given title
    /// - Parameter title: The title of the task to add
    func addTask(withTitle title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    /// Updates the completion status of a task
    /// - Parameter task: The task to update
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.toggleCompletion()
        }
    }
    
    /// Deletes a task at the specified index
    /// - Parameter indexSet: The index set containing the task to delete
    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    /// Moves a task from one position to another
    /// - Parameters:
    ///   - source: The original position of the task
    ///   - destination: The new position for the task
    func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    /// Checks if the task list is empty
    /// - Returns: True if there are no tasks, false otherwise
    func hasNoTasks() -> Bool {
        return tasks.isEmpty
    }
    
    // MARK: - Private Methods
    
    /// Saves the current tasks to device storage
    private func saveTasks() {
        _ = JSONLoader.saveToUserDefaults(tasks, forKey: tasksStorageKey)
    }
}
