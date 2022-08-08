//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Ufuk on 8.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        
        
        
    }
    
    @objc func addButtonClicked (){
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }


}

