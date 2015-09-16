//
//  FirstViewController.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/8/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import UIKit

class MealTabViewController: UIViewController {
    
    var mealCardView:MealCardView = MealCardView()
    
    @IBOutlet weak var mealNavigationItem: UINavigationItem!
    
    @IBOutlet weak var backgroundView: UIView!

    @IBOutlet weak var mainContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Appearance setup
        println("Welcome to EatTime")
        // temp test fbsdk
        let params = ["fields":"email,friends,timezone"]
        var request:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "/me", parameters: params, HTTPMethod: "GET")
        request.startWithCompletionHandler({
            (connetion,result,error) -> Void in
            print("Facebook result")
            if error == nil {
                println(result)
            } else {
                println(error)
            }
        })
        var friendlistRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "/me/friends", parameters:nil, HTTPMethod: "GET")
        friendlistRequest.startWithCompletionHandler({
            (connetion,result,error) -> Void in
            print("Facebook friends result")
            if error == nil {
                println(result)
            } else {
                println(error)
            }

        })
        self.backgroundView.backgroundColor = _backgroundColorLight
        var logoImageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        logoImageView.contentMode = .ScaleAspectFit
        logoImageView.image = UIImage(named: "logo")
        mealNavigationItem.titleView = logoImageView
        
        self.setUp()
        self.refreshData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        println("Home Page")
        self.refreshData()
    }
 
    func setUp() {
        // Set up swipable cardView
        self.mainContentView.layoutIfNeeded()
        self.mealCardView.loadViewFromNib()
        var cardFrame:CGRect = self.mainContentView.frame
        cardFrame.size.height = 400
        self.mealCardView.frame = cardFrame
        self.backgroundView.addSubview(self.mealCardView)
        println(backgroundView.frame.size.height)
        
        // Set up UIGuesture
        var swipeRightGuesture:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        swipeRightGuesture.direction = UISwipeGestureRecognizerDirection.Right
        self.mealCardView.addGestureRecognizer(swipeRightGuesture)
        
        var swipeLeftGuesture:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeLeft:")
        swipeLeftGuesture.direction = UISwipeGestureRecognizerDirection.Left
        self.mealCardView.addGestureRecognizer(swipeLeftGuesture)

    }

    func swipeRight(gueture: UISwipeGestureRecognizer) {
        println("swipt right")
    }
    
    func swipeLeft(gueture: UISwipeGestureRecognizer) {
        println("swipt left")
    }
}

// MARK : Data Refresh
extension MealTabViewController {
    func refreshData() {
        
    }
}
