//
//  MenuPiattiViewController.swift
//  XSwift002
//
//  Created by Juan Manuel Moreno on 14/08/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

import UIKit

class MenuPiattiViewController: UITableViewController {
    
    var piatti: [Piatto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Hola piatti")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return piatti.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ListPrototypeCell")
        cell.textLabel?.text = piatti[indexPath.row].name // Escribimos nombre de plato en la posicion dada por la celda y el array de platos.
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
