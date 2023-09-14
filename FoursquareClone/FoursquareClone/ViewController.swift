//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Ufuk on 9.09.2023.
//

import UIKit
import ParseSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [ParseObject "name"] = "apple"
        [ParseObject "calories"] = 100
        ParseObject.saveInBackround
        
        
        
        // Do any additional setup after loading the view.
    }

    
    
    
}

