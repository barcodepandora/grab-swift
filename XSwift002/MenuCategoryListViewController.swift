//
//  MenuCategoryListViewController.swift
//  XSwift002
//
//  Created by Juan Manuel Moreno on 14/08/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

import UIKit

class MenuCategoryListViewController: UITableViewController {
    
    var menu: [MenuCategory] = []
    let aTransition = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Hola Swift")
        loadCategories(); // Cargamos categorias.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu.count
    }

     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {

        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ListPrototypeCell")
        cell.textLabel?.text = menu[indexPath.row].name
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("GoToCategorySegue", sender: indexPath) // Lanzamos segue
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "GoToCategorySegue" { // Validamos segue
            
            let navigation = segue.destinationViewController as? UINavigationController // Referenciamos el UINavigationController
            if let destination = navigation?.topViewController as? MenuCategoryViewController { // Validamos que navigation tiene MenuCategoryViewController

                destination.categoryN = menu[sender!.row].url
                destination.title = menu[sender!.row].name
                navigation!.transitioningDelegate = aTransition
            }
        }
    }

    func loadCategories() {
        
        var category = MenuCategory();
        
        var client = JSONClient();
        client.doCategories();
        for categoryT in client.categories {

            category = MenuCategory();
            category.name = categoryT["name"] as! String;
            category.url = categoryT["url"] as! String;
            menu.append(category);
        }
    }
}
