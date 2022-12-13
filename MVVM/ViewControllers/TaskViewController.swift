//
//  TaskViewController.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 05.12.2022.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //private let task = TaskAPI.getTask() // model
    let taskTableView = UITableView() // view
    
    lazy var viewModel: TaskAPI = {
        TaskAPI()
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(taskTableView)
        
        taskTableView.translatesAutoresizingMaskIntoConstraints = false
                
        taskTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        taskTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        taskTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        taskTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
        
        
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")

        navigationItem.title = "Task"


    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.task = viewModel.tasks[indexPath.row]
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = viewModel.tasks[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.task = task
        self.navigationController?.pushViewController(detailVC, animated: true)
    }


    
}


