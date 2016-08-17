//
//  MealTableTableViewController.swift
//  projetoAlura01
//
//  Created by LuizRamos on 16/08/16.
//  Copyright © 2016 LuizRamos. All rights reserved.
//

import UIKit

class MailTableTableViewController: UITableViewController {
        
    
    var meals = [Meal(name: "eggplant brownie", happiness: 5),
        Meal(name: "zucchini muffin", happiness: 3)]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
    
    func add(meal: Meal){
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]

        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
       // if let cell.
//        if cell.textLabel == cell.textLabel{
//            cell.textLabel!.text = meal.name
//        }
        cell.textLabel!.text = meal.name
        return cell
    }
}
