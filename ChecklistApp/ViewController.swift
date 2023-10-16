//
//  ViewController.swift
//  ChecklistApp
//
//  Created by Abdur Razzak on 11/10/23.
//

import UIKit

class ChecklistItem {
    let title: String
    var isChecked: Bool = false
    
    
    init(title: String) {
        self.title = title
    }
}

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let items: [ChecklistItem] = [
        "get in milk ","get in Apple ",
        "get in milk ","get in milk ",
        "get in milk ","get in milk ",
    ].compactMap({ChecklistItem(title: $0)
    })
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.isChecked ? .checkmark : .none
        
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //toggle checkmark on and off
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //add animation so cell does not stay selected
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

