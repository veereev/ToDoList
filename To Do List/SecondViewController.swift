//
//  SecondViewController.swift
//  To Do List
//
//  Created by VEERASEKHAR ADDEPALLI on 26/12/16.
//  Copyright © 2016 VEERASEKHAR ADDEPALLI. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemTextField: UITextField!
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer)
    {
        itemTextField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String]
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            if itemTextField.text! != ""{
            items.append(itemTextField.text!)
            }
        }
        else
        {
             items = [itemTextField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

