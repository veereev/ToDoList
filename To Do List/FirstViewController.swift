//
//  FirstViewController.swift
//  To Do List
//
//  Created by VEERASEKHAR ADDEPALLI on 26/12/16.
//  Copyright © 2016 VEERASEKHAR ADDEPALLI. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var items: [String] = []
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String]{
            items = tempItems
        }
        table.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoCell")
        
        cell.textLabel?.text = items[indexPath.row] as! String
        
       // BBFFDD
        
      cell.backgroundColor = UIColor.purple
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete
       {
        let ac = UIAlertController(title: "Delete this item?", message: "Are you sure you want to delete this item", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {
            (action) -> Void in
            self.items.remove(at: indexPath.row)
            self.table.reloadData()
            UserDefaults.standard.set(self.items, forKey: "items")
        
        })
        ac.addAction(deleteAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        
      
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

