//
//  Item.swift
//  projetoAlura01
//
//  Created by LuizRamos on 14/08/16.
//  Copyright © 2016 LuizRamos. All rights reserved.
//

import Foundation
public class Item: Equatable{
    
    let name: String
    
    let calories: Double
    
    
    
    init(name: String, calories: Double){
        
        self.name=name
        
        self.calories = calories
        
    }
    
    
    
}

public func ==(first: Item, second: Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}

