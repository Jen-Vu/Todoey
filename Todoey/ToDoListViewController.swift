//
//  ViewController.swift
//  Todoey
//
//  Created by Jonathan Tran on 6/9/19.
//  Copyright © 2019 Jen Vu. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Call Chi", "Eat cake", "Feed Vic", "Clean house"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            
            itemArray = items
        }
        
    }
    
    
    // MARK - Tableview Datasource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    
    // MARK - Tableview Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
                if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        
                    tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
                }
                else {
                    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                }
        
                tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // What will happen once the user clicks the Add Item button on our UIAlert
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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

