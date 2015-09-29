//
//  Login.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/8/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!

    @IBOutlet weak var fakeLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Facebook Prep
        self.loginButton = FBSDKLoginButton()
        loginButton.frame = self.fakeLogin.frame
        self.backEndTest()
        loginButton.readPermissions = ["public_profile","email","user_friends"]
        self.loggedIn(["i":"i"])
        
//        self.pushNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Talk to backgound test
    func backEndTest() {
        PFCloud.callFunctionInBackground("hello", withParameters: ["movie":"The Matrix"]) {
            (result: AnyObject?, error: NSError?) in
            if let data : NSString = result as? NSString {
                println(data)
            }
        }
    }
    
    /**
      * Send data to backend when user successfully logged into Facebook
      */
    func loggedIn(userData:NSDictionary) {
        println("Login function")
        PFCloud.callFunctionInBackground("logged_in", withParameters:userData as! [NSString: NSString]) {
            (result: AnyObject?, error: NSError?) in
            if let data : NSString = result as? NSString {
                NSLog("Return Value \(result) ")
            }
            else if (error != nil) {
                NSLog("error in logged in: \(error)")
            }
        }
    }
    
    /**
    * Send data to backend when user successfully logged into Facebook
    */
    func pushNotification() {
        println("Push function")
        var paras:NSDictionary = ["text":"Test push notification"]
        PFCloud.callFunctionInBackground("PushNotification", withParameters:paras as! [NSString: NSString]) {
            (result: AnyObject?, error: NSError?) in
            if let data : NSString = result as? NSString {
                NSLog("Return Value \(result) ")
            }
            else if (error != nil) {
                NSLog("error in logged in: \(error)")
            }
        }
    }
}

extension LoginViewController: FBSDKLoginButtonDelegate{
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
            self.failLogIn()
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
//            if result.grantedPermissions.contains("email")
//            {
//                // Do work
//            }
            self.successfulLogIn()
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
}

//MARK : Update user data
extension LoginViewController {
    /**
    * Logged in facebook Call back
    */
    func successfulLogIn() {
        println("User Logged In Success")
        self.getUserData()
    }
    
    /**
    * Cancelled facebook login Call back
    */
    func failLogIn() {
        println("User Logged In Fails")
    }
    
    
    /**
    * Retrive data from facebook api
    * saved in to UserDefault
    * Update parse database
    */
    func getUserData() {
        let params = ["fields":"email,friends,timezone,gender"]
        var request:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "/me", parameters: params, HTTPMethod: "GET")
        request.startWithCompletionHandler({
            (connetion,result,error) -> Void in
            print("Facebook result")
            if error == nil {
                println(result)
                var err:NSErrorPointer = NSErrorPointer()
                if let jsonresult:NSDictionary = result as? NSDictionary {
                    println(jsonresult["email"])
                    // TODO:
                    // Save Parse object if any
                    var user = PFObject(className:"_USER")
//                    user["fbid"] = jsonresult["id"] as? String
//                    user.setObject(object: (jsonresult["id"] as? String), forKey: "deviceToken")
                    user.saveInBackgroundWithBlock {
                        (success: Bool, error: NSError?) -> Void in
                        if (success) {
                            // The object has been saved.
                            println("save successfully")
                            let defaults = NSUserDefaults.standardUserDefaults()
                            defaults.setObject(user.objectId, forKey: "pid")
                        } else {
                            // There was a problem, check error.description
                        }
                    }
                    // Set up UserDefault
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setObject(jsonresult["email"] as? String, forKey: "email")
                    defaults.setObject(jsonresult["id"] as? String, forKey: "fbid")
                    
                    
                    //Segua to main pages
                }
            }
            else {
                println(error)
            }
        })
    }
    
    
}
