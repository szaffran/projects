//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by steph on 29/11/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
   
    var meal : [Meal] = [Meal(name : "breakfast" ), Meal(name : "lunch") , Meal( name : "dinner")]
    
    
    
    override func viewDidLoad() {
        
        
         super.viewDidLoad()
        
        meal[0].food = [Food(name : "eggs", description : "eggs on the plate"), Food( name : "cereal", description: "cereal in milk")]
        meal[1].food = [Food(name : "salade", description : "big salade"), Food( name : "pasta", description: "pasta with cheese")]
        meal[2].food = [Food(name : "rice", description : "good rice"), Food( name : "chicken", description: "shnitzel")]
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    //return number of section for the tableview
   override func numberOfSections(in tableView: UITableView) -> Int {
       return meal.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return meal[section].food!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "FoodCell",for: indexPath)
        
//        let meal1 = meal[indexPath.section]
//         let food1 = meal1.food![indexPath.row]
//        cell.textLabel?.text = food1.name
//        cell.detailTextLabel?.text = food1.description
        var nameOfTheMeal = meal[indexPath.section].name
        cell.textLabel?.text = meal[indexPath.section].food![indexPath.row].name
        cell.detailTextLabel?.text = meal[indexPath.section].food![indexPath.row].description
        
       }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        <#code#>
    }
    
  
}
