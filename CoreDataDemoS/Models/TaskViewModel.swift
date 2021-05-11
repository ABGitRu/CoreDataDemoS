//
//  TaskViewModel.swift
//  CoreDataDemoS
//
//  Created by Mac on 11.05.2021.
//

import Foundation

class TaskViewModel: TaskViewModelProtocol {
    
    // MARK: - Public Properties
    
    var tasks: [Task]
    
    // MARK: - Init
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
    
    // MARK: - Public Methods
    func getNumberOfRows() -> Int {
        tasks.count
    }
    
    func getCellViewModel(for indexPath: IndexPath) -> TaskCellViewModelProtocol {
        return TaskCellViewModel(task: tasks[indexPath.row])
    }

}
