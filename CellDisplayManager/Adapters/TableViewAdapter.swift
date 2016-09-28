//
//  TableViewAdapter.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 13/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import UIKit

public class TableViewAdapter : NSObject {
    let animation = UITableViewRowAnimation.fade
    let tableView: UITableView
    weak var input: AdapterInput?
    
    public init(tableView table: UITableView) {
        tableView = table
    }
    
}

extension TableViewAdapter : UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return input!.numberOfSections()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return input!.numberOfItems(inSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension TableViewAdapter : AdapterOutput {
    func reloadData() {
        tableView.reloadData()
    }
    
    func insert(sections: IndexSet) {
        tableView.insertSections(sections, with: animation)
    }
    
    func delete(sections: IndexSet) {
        tableView.deleteSections(sections, with: animation)
    }
    
    func reload(sections: IndexSet) {
        tableView.reloadSections(sections, with: animation)
    }
    
    func move(section from: Int, to: Int) {
        tableView.moveSection(from, toSection: to)
    }
    
    func insert(items: [IndexPath]) {
        tableView.insertRows(at: items, with: animation)
    }
    
    func delete(items: [IndexPath]) {
        tableView.deleteRows(at: items, with: animation)
    }
    
    func reload(items: [IndexPath]) {
        tableView.reloadRows(at: items, with: animation)
    }
    
    func move(item from: IndexPath, to: IndexPath) {
        tableView.moveRow(at: from, to: to)
    }
    
    func performBatchUpdates(_ updates: (() -> Void)) {
        tableView.beginUpdates()
        updates()
        tableView.endUpdates()
    }
}
