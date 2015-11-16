//
//  SecondViewController.swift
//  KOTH
//
//  Character screen.
//
//  Created by Philip Bouman on 13-11-15.
//  Copyright © 2015 Philip Bouman. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    /**************************
             VARIABLES
    **************************/
    
    // Character data, stored as:
    //      image, soundbite1, soundbite2, name, age, job
    var hank : [AnyObject] = ["hank.png", "Hank1", "Hank2", "Henry \"Hank\" Rutherford Hill", "43", "Assisted manager of Strickland Propane"]
    var peggy : [AnyObject] = ["peggy.jpg", "Peggy1", "Peggy2", "Margaret J. \"Peggy\" Hill", "42", "Substitute Spanish Teacher"]
    var bobby : [AnyObject] = ["Bobby.png", "Bobby1", "Bobby2", "Robert Jeffrey \"Bobby\" Hill", "13", "Student at Tom Landry Middle School"]
    var bill : [AnyObject] = ["Bill.jpg", "Bill1", "Bill2", "William \"Bill\" Fontaine de la Tour Dauterive", "41", "Army Sergeant/ Barber"]
    var dale : [AnyObject] = ["Dale.jpg", "Dale1", "Dale2", "Dale Alvin Gribble", "40", "Exterminator"]
    var jeff : [AnyObject] = ["Boomhauer.jpg", "Boomhauer1", "Boomhauer2", "Jeff Boomhauer", "40", "Texas Ranger"]
    var currentChar : [AnyObject] = []
    
    // ID of button clicked from ViewController (profiles screen)
    var toPass:Int!
    
    // soundboard quotes
    var quote1 : AVAudioPlayer?
    var quote2 : AVAudioPlayer?
    
    // vote value
    var rating : Int = 1

    /**************************
               OUTLETS
    **************************/
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var charText: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    /**************************
               ACTIONS
    **************************/
    
    // confirm vote
    @IBAction func voteButton(sender: AnyObject) {
        print("\(rating)")
        saveVote()
    }

    // set vote value
    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rating = 1
        case 1:
            rating = 2
        case 2:
            rating = 3
        case 3:
            rating = 4
        case 4:
            rating = 5
        default:
            rating = 1
        }
    }
    
    // quote button 1
    @IBAction func quoteButton1(sender: AnyObject) {
        quote1?.play()
    }
    
    // quote button 2
    @IBAction func quoteButton2(sender: AnyObject) {
        quote2?.play()
    }
    
    /**************************
             FUNCTIONS
    **************************/
    
    // load view
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharData(toPass)
        displayVote()
        displayProfile()
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
    
    // connect all data to profile
    func displayProfile() {
        loadImage()
        loadSound()
        loadText()
        currentChar = []
    }
    
    // load profile pic
    func loadImage() {
        let newImg: UIImage? = UIImage(named: currentChar[0] as! String)
        self.charImage.image = newImg
    }
    
    // load soundbites
    func loadSound() {
        quote1 = setupAudioPlayerWithFile(currentChar[1] as! String, type:"aif")
        quote2 = setupAudioPlayerWithFile(currentChar[2] as! String, type:"aif")
    }
    
    // load char info
    // Multiple fonts, indentation?
    func loadText() {
        charText.text = "NAME: \(currentChar[3])\u{0085}AGE:    \(currentChar[4])\u{0085}JOB:    \(currentChar[5])"
    }
    
    // save vote in NSUserDefaults
    func saveVote() {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(rating, forKey: "vote \(toPass)")
        defaults.synchronize()
    }
    
    // load vote from NSUserDefault
    func displayVote() {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let vote = defaults.valueForKey("vote \(toPass)") as? Int
        
        if vote != nil {
            segmentedControl.selectedSegmentIndex = vote! - 1
        }
    }
    
    // Setup audioplayer and load files
    func setupAudioPlayerWithFile(file:String, type:String) -> AVAudioPlayer?  {
        // setup path
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        var audioPlayer:AVAudioPlayer?
        
        // setup player
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        audioPlayer?.prepareToPlay()
        return audioPlayer
    }
}
