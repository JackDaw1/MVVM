//
//  TaskAPI.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 05.12.2022.
//let nameOfArticle:String?
//let customer:String?
//let price:Int?

import Foundation

class TaskAPI {

    typealias Tasks = [Task]
    lazy var tasks: Tasks = {
        return [
            Task(nameOfArticle: "SQL Tutorial", customer: "proglib", price: 100, numberOfSigns: 1500),
            Task(nameOfArticle: "iOS Tutorial", customer: "habr", price: 200, numberOfSigns: 1500)
        ]
    }()

    func didSelectRow(at indexPath: IndexPath) {
        
    }
}


