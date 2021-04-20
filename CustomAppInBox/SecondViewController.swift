//
//  SecondViewController.swift
//  CustomAppInBox
//
//  Created by Jay Mehta on 04/08/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import UIKit
import CleverTapSDK

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CleverTap.sharedInstance()?.recordEvent("Custom App Inbox Second")
        CleverTap.sharedInstance()?.profilePush(["app":"inbox"])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
