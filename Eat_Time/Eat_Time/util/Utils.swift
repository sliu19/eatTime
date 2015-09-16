//
//  Utils.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/8/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    class var sharedInstance:Utils {
        struct Singleton {
            static let instance = Utils()
        }
        return Singleton.instance
    }
    
    private init() {}
    
}
