//
//  TaskListViewModel.swift
//  AirVet
//
//  Created by Jian Ma on 8/27/24.
//

import Foundation

class TaskListViewModel {
    private(set) var tasks: [Task] = []
    
    var tasksDidChange: (() -> Void)?
    
    func addTask(_ task: Task) {
        tasks.append(task)
        tasksDidChange?()
    }
    
    func toggleTaskCompletion(at index: Int) {
        tasks[index].isCompleted.toggle()
        tasksDidChange?()
    }
}
