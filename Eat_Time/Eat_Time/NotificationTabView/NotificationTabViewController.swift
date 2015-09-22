//
//  NotificationTabViewController.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/22/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import Foundation
import UIKit

class NotificationTabViewController: UITableViewController {
    
    @IBOutlet var mainTableView: UITableView!
    override func viewDidLoad() {
        println("Notification Page")
        super.viewDidLoad()
        self.mainTableView.registerNib(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
    }

}

extension NotificationTabViewController :UITableViewDelegate, UITableViewDataSource {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell", forIndexPath: indexPath) as! NotificationTableViewCell
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
}
