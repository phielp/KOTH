//
//  ViewController.swift
//  KOTH
//  
//  Profile screen.
//
//  Created by Philip Bouman on 09-11-15.
//  Copyright © 2015 Philip Bouman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // character buttons
    @IBAction func charButtons(sender: AnyObject) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // send tag value to secondviewcontroller (svc)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "charInfo") {
            let svc = segue.destinationViewController as! SecondViewController;
            
            svc.toPass = sender.tag
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

