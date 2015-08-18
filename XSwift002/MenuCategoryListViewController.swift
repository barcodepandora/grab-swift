//
//  MenuCategoryListViewController.swift
//  XSwift002
//
//  Created by Juan Manuel Moreno on 14/08/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

import UIKit
import CoreData

class MenuCategoryListViewController: UITableViewController {
    
    var menu: [MenuCategory] = [] // Array de cateogorias
    let aTransition = TransitionManager() // Transiciones
    
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

        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ListPrototypeCell") // Cargamos cell dado el TableView con id. ListPrototypeCell
        cell.textLabel?.text = menu[indexPath.row].name // Cargamos nombre de categoría dado por la posición de cell y array
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("GoToCategorySegue", sender: indexPath) // Lanzamos segue
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "GoToCategorySegue" { // Validamos segue
            
            let navigation = segue.destinationViewController as? UINavigationController // Referenciamos el UINavigationController asociado al segue
            if let destination = navigation?.topViewController as? MenuCategoryViewController { // Validamos que el objeto navigation tiene MenuCategoryViewController

                destination.categoryN = menu[sender!.row].url // Cargamos nombre de categoría en MenuCategoryViewController
                destination.title = menu[sender!.row].name // Cargamos título de MenuCategoryViewController.
                navigation!.transitioningDelegate = aTransition // Cargamos transición
            }
        }
    }

    /**
     * Carga categorías desde un origen externo con cliente JSON
     */
    func loadCategories() {
        
        var category = MenuCategory(); // Objeto categoría
        
        var client = JSONClient(); // Cliente JSON.
        client.doCategories(); // Traemos categorías con JSON.
        
        for categoryT in client.categories { // Recorremos categorías que trajimos.

            category = MenuCategory(); // Cargamos categoría con contenido JSON
            category.name = categoryT["name"] as! String;
            category.url = categoryT["url"] as! String;
            menu.append(category); // Agregamos a array de categorías.
        }
    }
    
    
    /**
     * Carga categorías con CoreData
     */
    /*func loadCategories() {
    
        var client = JSONClient(); // Cliente JSON.
        client.doCategories(); // Traemos categorías con JSON.
        
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        for categoryT in client.categories { // Recorremos categorías que trajimos.
            
            let category = NSEntityDescription.insertNewObjectForEntityForName("MenuCategory", inManagedObjectContext: managedObjectContext!) as! MenuCategory
            
            category.name = categoryT["name"] as! String;
            category.url = categoryT["url"] as! String;
            menu.append(category); // Agregamos a array de categorías.
        }
    }*/
}
