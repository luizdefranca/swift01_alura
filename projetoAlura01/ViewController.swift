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
        let name = nameTxtField.text
        let happiness = happinessTxtField.text
        print("eaten: \(name)  \(happiness)")
    }


}

