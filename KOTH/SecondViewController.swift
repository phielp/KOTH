//
//  SecondViewController.swift
//  KOTH
//
//  Created by Philip Bouman on 13-11-15.
//  Copyright © 2015 Philip Bouman. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var hank : [AnyObject] = ["hank.png"]
    var peggy : [AnyObject] = ["peggy.jpg"]
    var bobby : [AnyObject] = ["Bobby.png"]
    var bill : [AnyObject] = ["Bill.jpg"]
    var dale : [AnyObject] = ["Dale.jpg"]
    var jeff : [AnyObject] = ["Boomhauer.jpg"]
    var currentChar : [AnyObject] = []
    
    var toPass:Int!
    
    @IBOutlet weak var charImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(toPass)")
        getCharData(toPass)
        displayProfile()
        // load sounds
        //        kothTune = setupAudioPlayerWithFile("kothTune", type:"wav")
    }
    
    
    // get character data
    func getCharData(tag: Int) {
        switch tag {
        case 0:
            currentChar = hank
        case 1:
            currentChar = peggy
        case 2:
            currentChar = bobby
        case 3:
            currentChar = bill
        case 4:
            currentChar = dale
        case 5:
            currentChar = jeff
        default:
            currentChar = hank
        }
    }
    
    // 
    func displayProfile() {
        print("\(currentChar[0])")
        loadImage()
        currentChar = []
    }
    
    func loadImage() {
        let newImg: UIImage? = UIImage(named: currentChar[0] as! String)
        self.charImage.image = newImg
    }
}
