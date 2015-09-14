//
//  MealCardView.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/8/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import Foundation
import UIKit

class MealCardView : UIView {
    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet var view: MealCardView!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) { // for using CustomView in
        super.init(coder: aDecoder)
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> MealCardView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName:"MealCardView", bundle: nil)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! MealCardView
        
        return view
    }
    
    override func awakeFromNib() {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
    }
    
}