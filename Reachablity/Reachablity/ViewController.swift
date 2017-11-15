//
//  ViewController.swift
//  Reachablity
//
//  Created by Anirudh on 14/12/16.
//  Copyright © 2016 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lableNetworkStatus: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "networkChanged", name: "NetworkStatusChanged", object: nil)
        let netstatus = networkChanged()
        print("netstatus \(netstatus)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func networkChanged() -> Bool {
        if reachablityStatus == kNOTREACHABLE {
            lableNetworkStatus.text = "Network not reachable"
            self.view.backgroundColor = UIColor.redColor()
            return false
        } else if reachablityStatus == kREACHABLEWITHWIFI {
            lableNetworkStatus.text = "Network reachable With WIFI"
            self.view.backgroundColor = UIColor.greenColor()
            return true
        } else if reachablityStatus == kREACHABLWITHWWAN {
            lableNetworkStatus.text = "Network reachable With WWAN"
            self.view.backgroundColor = UIColor.blueColor()
            return true
        }
        return false
    }
    
    deinit{
            NSNotificationCenter.defaultCenter().removeObserver(self, name: "NetworkStatusChanged", object: nil )
    }
}

