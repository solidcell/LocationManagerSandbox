//
//  ViewController.swift
//  LocationManagerSandbox
//
//  Created by Jesse Farless on 11/7/16.
//  Copyright © 2016 solidcell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func requestWhenInUseAuthorizationTap(_ sender: AnyObject) {
        print("request")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

