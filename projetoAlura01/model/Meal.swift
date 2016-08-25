//
//  Meal.swift
//  projetoAlura01
//
//  Created by LuizRamos on 14/08/16.
//  Copyright © 2016 LuizRamos. All rights reserved.
//

import Foundation

public class Meal{
    
    let name: String
    
    let happiness: Int
    
    var items = Array<Item>()
    
    
    
    init(name: String, happiness: Int) {
        
        self.name = name
        
        self.happiness = happiness
        
    }
    
    
    
    func allCalories() -> Double{
        
        var total = 0.0
        
        for i in items{
            
            total += i.calories
            
        }
        
        return total
        
    }
    
    func detail() -> String{
        print(items.count)
        var message = "Happiness: \(happiness) "
        for i in items{
            message += "\n * \(i.name) - \(i.calories) calories"
            print(message)
        }
        
        return message
    }
    
}


