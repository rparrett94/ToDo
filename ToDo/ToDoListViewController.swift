//
//  ViewController.swift
//  ToDo
//
//  Created by Ryan Parrett on 31/03/2019.
//  Copyright © 2019 Ryan Parrett. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Clean car"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Clean kitchen"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Clean bathroom"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Walk Dog"
        itemArray.append(newItem4)
        
        let newItem5 = Item()
        newItem5.title = "Hoover house"
        itemArray.append(newItem5)
        
        let newItem6 = Item()
        newItem6.title = "Garden work"
        itemArray.append(newItem6)
        
        let newItem7 = Item()
        newItem7.title = "Change bed sheets"
        itemArray.append(newItem7)
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
        
 
    }
    //TableView DatasourceMethods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //Tableview delegate methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData() //forces the tableview to run cellForRowAtIndexPath
    }
    
    //Add new items section
    
    @IBAction func addItem(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController.init(title: "Add To Do ITem", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func randomButton(_ sender: Any) {
        let randomTask = self.itemArray[Int.random(in: 0 ..< itemArray.count)]
        let alertController = UIAlertController(title: "Your random task is...", message: "\(randomTask.title)", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
}

