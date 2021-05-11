//
//  TaskViewModelProtocol.swift
//  CoreDataDemoS
//
//  Created by Mac on 11.05.2021.
//

import Foundation

protocol TaskViewModelProtocol {
    
    var tasks: [Task] { get set }
    func getNumberOfRows() -> Int
    func getCellViewModel(for indexPath: IndexPath) -> TaskCellViewModelProtocol
}
