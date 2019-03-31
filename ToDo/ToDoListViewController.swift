//
//  ViewController.swift
//  ToDo
//
//  Created by Ryan Parrett on 31/03/2019.
//  Copyright © 2019 Ryan Parrett. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
    var itemArray = ["Clean car", "Clean kitchen", "Clean bathroom", "Walk Dog", "Change bed sheets", "Hoover house", "Garden work"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //TableView DatasourceMethods
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //Tableview delegate methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

    }
    
    //Add new items section
    
    @IBAction func addItem(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController.init(title: "Add To Do ITem", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    


}

