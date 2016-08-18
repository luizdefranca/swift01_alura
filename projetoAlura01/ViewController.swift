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
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    @IBOutlet var nameTxtField: UITextField?
    
    @IBOutlet var happinessTxtField: UITextView?
//    var delegate: MailTableTableViewControlle
    var delegate: AddMealDelegate?
    var items = [
            Item(name: "Eggplant Brownie", calories: 10),
            Item(name: "Zucchini Muffin", calories: 10),
            Item(name: "Cookie", calories: 10),
            Item(name: "Coconut", calories: 500),
            Item(name: "Chocolate frosting", calories: 1000),
            Item(name: "Chocolate chip", calories: 1000)
                ]
    var selected = Array<Item>()



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

        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let row = indexPath.row
        let item = items[row]
        if cell == nil{
            return
        }
        if cell!.accessoryType == UITableViewCellAccessoryType.None {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(item)

        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
//            let position = find(selected, item)
//            selected.removeAtIndex(position!)
            let position = selected.indexOf(item)
            selected.removeAtIndex(position!)
        }



    }
    
    
    @IBAction
    func add(){
        if nameTxtField == nil || happinessTxtField == nil {
            return
        }
        let name = nameTxtField!.text
        let happiness = Int(happinessTxtField!.text)
        let meal = Meal(name: name!, happiness: happiness!)
//        meal.items = selected
        print("eaten: \(meal.name) | \(meal.happiness) | \(meal.items.description)")
        if delegate == nil {
            return
        }
        
        delegate!.add(meal)
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)

        }
    }



}

