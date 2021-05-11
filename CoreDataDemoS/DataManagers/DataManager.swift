//
//  DataManager.swift
//  CoreDataDemoS
//
//  Created by Mac on 11.05.2021.
//

import Foundation
import CoreData

class DataManager {
    
    // MARK: - Public Properties
    
    static let shared = DataManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemoS")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext = { persistentContainer.viewContext }()

    // MARK: - Init
    
    private init() {}

    // MARK: - Public Methods
    
    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addTask(name: String, completion: @escaping (Task) -> ()) {
        let task = NSEntityDescription.insertNewObject(
            forEntityName: "Task",
            into: viewContext) as! Task
        task.title = name
        saveTask(task: task, completion: completion)
    }
    
    func updateTask(task: Task, name: String, completion: @escaping (Task) -> ()) {
        task.title = name
        saveTask(task: task, completion: completion)
    }
    
    func deleteTask(task: Task, completion: @escaping (Task) -> ()) {
        viewContext.delete(task)
        saveTask(task: task, completion: completion)
    }
    
    func saveTask(task: Task, completion: @escaping (Task) -> ()) {
        saveContext()
        completion(task)
    }
    
    func saveOrderTask(viewModel: TaskViewModelProtocol) {
        for index in viewModel.tasks.indices {
            viewModel.tasks[index].sort = Int64(index)
        }
        saveContext()
    }
    
    func fetchAllTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "sort", ascending: true)]
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
