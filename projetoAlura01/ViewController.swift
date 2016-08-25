//
//  ViewController.swift
//  projetoAlura01
//
//  Created by LuizRamos on 11/08/16.
//  Copyright © 2016 LuizRamos. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func add(meal: Meal)
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {


    @IBOutlet var nameTxtField: UITextField?

    @IBOutlet var happinessTxtField: UITextView?
    //    var delegate: MailTableTableViewControlle
    //  Create a delegate
    var delegate: AddMealDelegate?
   
    
    var items = [
        Item(name: "Eggplant Brownie", calories: 10),
        Item(name: "Zucchini Muffin", calories: 10),
        Item(name: "Cookie", calories: 10),
        Item(name: "Coconut", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000),
        Item(name: "Coconut", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000)
    ]
    var selected = Array<Item>()

    @IBOutlet var tableView: UITableView?
    @IBAction func add(){
        
        if let meal = getMealFromForm(){
            if let mealDelegate = delegate{
                mealDelegate.add(meal)
                if let navigation = self.navigationController{
                    navigation.popViewControllerAnimated(true)
                } else{
                    Alert(controller: self).show("Unexpected error, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
        
    }
    
    func getMealFromForm() -> Meal?{
        if nameTxtField == nil || happinessTxtField == nil {
            return nil
        }
        let name = nameTxtField!.text
        let happiness = Int(happinessTxtField!.text)
        let meal = Meal(name: name!, happiness: happiness!)
        meal.items = selected
        print("eaten: \(meal.name) | \(meal.happiness) | \(meal.items.description)")
        return meal

    }

    func addItem(newItem item: Item){
        items.append(item)
        if let table = tableView{
            table.reloadData()
        }else{
            Alert(controller: self).show("unexpected error")
        }

    
    }
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item",
        style: UIBarButtonItemStyle.Plain,
        target: self,
        action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }


    func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        }else{
            Alert(controller: self).show()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row

        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)

        let item = items[row]

        cell.textLabel!.text = item.name

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            let item = items[indexPath.row]
            if cell.accessoryType == UITableViewCellAccessoryType.None{
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                selected.append(item)
                
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.None
                //            let position = find(selected, item)
                //            selected.removeAtIndex(position!)
                if let position = selected.indexOf(item){
                selected.removeAtIndex(position)
                } else{
                    Alert(controller: self).show()
                }
            }
        }else{
            Alert(controller: self).show()
        }
       
        
        
            
    }
    
}







