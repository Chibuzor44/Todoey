//
//  ViewController.swift
//  Todoey
//
//  Created by Chibuzor Agubulom on 12/22/18.
//  Copyright © 2018 Chibuzor Agubulom. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    // Creating a plist for persistence of data
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadItems()
    }
    
    //MARK - Table view Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        // One liner
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        }
//        else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK -  TableView Delegate Method
    // Select or deselect row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray [indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // OR
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        }
//        else {
//            itemArray[indexPath.row].done = false
//        }
        
        saveItrms()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true) // Highlights cell and vanishes when tapped
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        //View controller of the alert pop-up
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {(action) in
            // what will happen when the user taps the add button
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.saveItrms()
        }
        alert.addTextField {(alertTextField) in
            alertTextField.placeholder = "Create new items"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK - Encoder Decoder methods
    func saveItrms() {
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }catch {
            print("Error in encoding item array \(error)")
        }
        tableView.reloadData()
    }
    
    
    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                self.itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error in decoding item array \(error)")
            }
        }
    }
}

