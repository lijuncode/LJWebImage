//
//  TableViewController.swift
//  LJWebImage
//
//  Created by  李俊 on 15/7/28.
//  Copyright © 2015年  李俊. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let apps: NSArray = AppInfo.appInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return apps.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> Cell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! Cell
        
        cell.app = apps[indexPath.row] as? AppInfo
        
        
        return cell
    }
    

    
}
