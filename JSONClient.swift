//
//  JSONClient.swift
//  XSwift002
//
//  Created by Juan Manuel Moreno on 15/08/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

import Foundation

class JSONClient: NSObject {
    
    var categories: [NSDictionary] = [] // Lista de categorias.
    
    func hello()-> String {
        
        return "Hola"
    }
    
    func doJson() {
        
        /*var endpoint = NSURL(string: "https://www.getpostman.com/collections/2a9f34a396ef5cd2822a")
        var data = NSData(contentsOfURL: endpoint!)

        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as?
            
            NSDictionary {
            //if let categories = json["requests"] as? NSArray {
                categories = (json["requests"] as? NSArray)!
                
                for item in categories {
                    // construct your model objects here
                    
                    let haruka = item["url"]
                    println("La categoria es \(haruka as! NSString)")
                }
            //}
        }*/

        var category = ["name": "Pasta", "url": "Pasta"];
        categories.append(category);
        category = ["name": "Pizza", "url": "Pizza"];
        categories.append(category);
    }

    func doCategories() -> NSArray {
        
        doJson();
        return categories
    }
    
    func doSubcategories(categoryN: NSString) -> NSArray {
        
        var subcategories: [NSDictionary] = []
        var subcategory = NSDictionary();
        
        println("La subcategoria es \(categoryN)!");
        
        if categoryN == "Pizza" {
            
            subcategory = ["name": "Clasica", "subcategory": [["name": "Margherita"], ["name": "Pomodoro"], ["name": "Bianca"]]];
            subcategories.append(subcategory);
            subcategory = ["name": "Rustica", "subcategory": [["name": "Margherita"], ["name": "Gamberetti"], ["name": "Prosciutto"]]];
            subcategories.append(subcategory);
        } else if categoryN == "Pasta" {
            
            subcategory = ["name": "Corta Ravioli", "subcategory": [["name": "Penne Primavera"], ["name": "Fusilli Pomodoro"], ["name": "Ravioli 4 Formaggi"]]];
            subcategories.append(subcategory);
            subcategory = ["name": "Larga", "subcategory": [["name": "Linguini"], ["name": "Spaghetti"], ["name": "Fettucini"]]];
            subcategories.append(subcategory);
        }

        return subcategories
    }
}
