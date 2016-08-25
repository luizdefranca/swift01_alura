//
//  NewItemViewController.swift
//  projetoAlura01
//
//  Created by LuizRamos on 23/08/16.
//  Copyright © 2016 LuizRamos. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate{
    func addItem(newItem item: Item)
}
class NewItemViewController: UIViewController {
   
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    var delegate: AddAnItemDelegate?

    // New Builder with a delegate as parameter
    init(delegate: AddAnItemDelegate){
        
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
    }
    
    @IBAction func addNewItem(){
        
        if nameField == nil || caloriesField == nil {
            return
        }
        let name = nameField!.text!
        let calories = NSString(string: caloriesField!.text!).doubleValue
        
        let item = Item(name: name, calories: calories)
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
        // Pass by delegate to ViewController
        if let deleg = delegate {
            deleg.addItem(newItem: item)
        }


    }
    
    
    

}
