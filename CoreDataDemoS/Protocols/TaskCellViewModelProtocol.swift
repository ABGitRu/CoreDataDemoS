//
//  TaskCellViewModelProtocol.swift
//  CoreDataDemoS
//
//  Created by Mac on 11.05.2021.
//


protocol TaskCellViewModelProtocol: class {
    
    var task: Task { get }
    var name: String { get }
    
}
