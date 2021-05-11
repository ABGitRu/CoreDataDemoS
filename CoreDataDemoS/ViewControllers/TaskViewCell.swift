//
//  TaskViewCell.swift
//  CoreDataDemoS
//
//  Created by Mac on 11.05.2021.
//

import UIKit

class TaskViewCell: UITableViewCell {

    weak var viewModel: TaskCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.name
        }
    }

}
