//
//  TaskCellViewModel.swift
//  CoreDataDemoS
//
//  Created by Mac on 11.05.2021.
//

import Foundation

class TaskCellViewModel: TaskCellViewModelProtocol {
    
    // MARK: - Public Properties
    
    var task: Task
    var name: String {
        return task.title ?? "undefined"
    }
    
    // MARK: - Init
    
    init(task: Task) {
        self.task = task
    }
    
}
