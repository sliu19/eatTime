//
//  MealNavigationController.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/8/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import UIKit

class MealNavigationController: UINavigationController {
    @IBOutlet weak var naviagtionBar: UINavigationBar!
    
    override func viewDidAppear(animated: Bool) {
        self.naviagtionBar.barTintColor = _mainColorTheme
    }

}
