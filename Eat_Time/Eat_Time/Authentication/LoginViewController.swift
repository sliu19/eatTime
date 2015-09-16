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

    @IBOutlet weak var fakeLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Facebook Prep
        var loginButton:FBSDKLoginButton = FBSDKLoginButton()
        loginButton.frame = self.fakeLogin.frame
        self.view.addSubview(loginButton)
        self.backEndTest()
        loginButton.readPermissions = ["public_profile","email","user_friends"]
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
            response, error in {
                println(response)
            }
        }
    }
    
    /**
      * Send data to backend when user successfully logged into Facebook
      */
    func loggedIn(userData:NSDictionary) {
        PFCloud.callFunctionInBackground("logged_in", withParameters: userData as [NSObject : AnyObject]) {
            response, error in {
                println(response)
            }
        }
    }

}
