//
//  NewEventViewController.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/13/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import UIKit
import Foundation

class NewEventViewController: UIViewController {
    @IBOutlet weak var mainScrollView: UIScrollView!

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        self.mainScrollView.backgroundColor = _backgroundColorLight
        self.commentTextView.backgroundColor = UIColor.clearColor()
    }
    
    
}
