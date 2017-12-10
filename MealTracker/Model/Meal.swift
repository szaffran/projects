//
//  Meal.swift
//  MealTracker
//
//  Created by steph on 29/11/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import Foundation

struct Meal{
 
    var name : String
    var food : [Food]?
    
    init (name : String){
        self.name = name
        self.food = nil
    }
}
