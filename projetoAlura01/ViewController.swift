//
//  ViewController.swift
//  projetoAlura01
//
//  Created by LuizRamos on 11/08/16.
//  Copyright © 2016 LuizRamos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet var nameTxtField: UITextField!
    
    @IBOutlet var happinessTxtField: UITextView!
    
    
    
    @IBAction
    func add(){
        if nameTxtField == nil || happinessTxtField == nil {
            return
        }
        let name = nameTxtField.text
        let happiness = Int(happinessTxtField.text)
        let meal = Meal(name: name!, happiness: happiness!)
        print("eaten: \(meal.name)  \(meal.happiness)")
    }


}

