//
//  ViewController.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 28/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import UIKit
import CellDisplayManager

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var manager: Manager? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let adapter = TableViewAdapter(tableView: tableView)
        manager = Manager()
    }
    
}

