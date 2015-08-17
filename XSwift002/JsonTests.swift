//
//  JsonTests.swift
//  XSwift002
//
//  Created by Juan Manuel Moreno on 15/08/15.
//  Copyright (c) 2015 Juan Manuel Moreno. All rights reserved.
//

import UIKit
import XCTest

class JsonTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

    func testHello() {
        // This is an example of a functional test case.
        
        let client = JSONClient()
        XCTAssertEqual(client.hello(), "Hola", "YES")
    }
    
    func testDoJSON() {
        // This is an example of a functional test case.
        
        let client = JSONClient()
        client.doJson()
        XCTAssert(true, "Pass")
    }
    
    func testDoCategories() {
        // This is an example of a functional test case.
        
        let client = JSONClient()
        let categories = client.doCategories()
        for category in categories {
            
            let name = category["name"]
            println("La categoria es \(name as! NSString))");
        }
        XCTAssert(true, "Pass")
    }
    
    func testDoSubcategories() {
        // This is an example of a functional test case.
        
        let client = JSONClient()
        let subcategories = client.doSubcategories("Pasta")
        for subcategory in subcategories {
            
            let name = subcategory["name"]
            println("La subcategoria es \(name as! NSString))");
            let piatti = subcategory["subcategory"]
            for piatto in piatti as! [NSDictionary]  {
            
                let wendy = piatto["name"]
                println("El plato es \(wendy as! NSString)");
            }
        }
        XCTAssert(true, "Pass")
    }
}
