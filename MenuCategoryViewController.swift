//
//  MenuCategoryViewController.swift
//  XSwift002
//
//  Created by Juan Manuel Moreno on 14/08/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

import UIKit

class MenuCategoryViewController: UITableViewController {

    @IBOutlet weak var bExit: UIBarButtonItem!
    
    var category: [MenuSubCategory] = []
    var categoryN = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Hola subcategorias")
        
        // Cargamos sobcategorias de la categoria.
        // La categoria ha sido asignada desde el segue que ha cargado este Controller.
        println("La subcategoria es \(categoryN)!");
        loadSubcategories();
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return piatti.count
        return category.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ListPrototypeCell")
        cell.textLabel?.text = category[indexPath.row].name // Escribimos nombre de subcategoria en la posicion dada por la celda y el array de subcategorias.
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("GoToPiattiSegue", sender: indexPath) // Lanzamos el segue dado por el Id. GoToPiattiSegue
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "GoToPiattiSegue" {
            
            let navigation = segue.destinationViewController as? UINavigationController // Referenciamos el UINavigationController
            if let destination = navigation?.topViewController as? MenuPiattiViewController { // Validamos que navigation tiene MenuPiattiViewController

                destination.piatti = category[sender!.row].piatti // Cargamos al Controller destino los platos de la subcategoria
                destination.title = category[sender!.row].name
            }
        }
    }

    @IBAction func exit(sender: UIBarButtonItem) {

    }
    
    func loadSubcategories() {
        
        var subcategory = MenuSubCategory(); // Subcategoria para mostrar en la vista
        var client = JSONClient(); // Cliente JSON
        var list = client.doSubcategories(categoryN); // Cargamos subcategorias desde JSON
        var plato: Piatto // Plato de una subcategoria
        
        for categoryT in list { // Recorremos subcategorias que trajimos
            
            subcategory = MenuSubCategory();
            subcategory.name = categoryT["name"] as! String; // Hacemos uso de objeto a String. El objeto es algo que existe.
            let piatti = categoryT["subcategory"] as! [NSDictionary] //  Hacemos uso de objeto a array de NSDictionary
            for piatto in piatti  { // Recorremos platos
                
                plato = Piatto(); // Objeto Piatto nuevo
                plato.name = piatto["name"] as! String // Asignamos valores a sus caracteristicas
                subcategory.piatti.append(plato) // Agregamos a array de platos.
            }
            category.append(subcategory); // Agregamos a array de subcategorias.
        }
    }
}
