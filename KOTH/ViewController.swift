//
//  ViewController.swift
//  KOTH
//
//  Created by Philip Bouman on 09-11-15.
//  Copyright © 2015 Philip Bouman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    var kothTune : AVAudioPlayer?   // music

    
    @IBAction func charButtons(sender: AnyObject) {
        print("\(sender.tag)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // load sounds
//        kothTune = setupAudioPlayerWithFile("kothTune", type:"wav")
    }


    
    
    // send tag value to secondviewcontroller (svc)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "charInfo") {
            let svc = segue.destinationViewController as! SecondViewController;
            
            svc.toPass = sender.tag
            
        }
    }

    
    
    
    // Setup audioplayer and load files
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

