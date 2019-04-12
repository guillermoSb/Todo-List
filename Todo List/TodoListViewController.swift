//
//  ViewController.swift
//  Todo List
//
//  Created by Guillermo Santos Barrios on 4/11/19.
//  Copyright © 2019 Guillermo Santos Barrios. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = ["Find Mafer", "Give her a kiss", "Love her till the end of the world"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Table View Methods
    
    // What the cells should display
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // MARK: - TableView Delegate Methods
    
    // Check if the user touches the cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        // De select row
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Add items
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add new Todo Item", message: "", preferredStyle: .alert)
        var textField: UITextField = UITextField()

        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user press the add button
            if !(textField.text!.isEmpty) {
                self.itemArray.append(textField.text!)
                self.tableView.reloadData()
            }
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    


}

