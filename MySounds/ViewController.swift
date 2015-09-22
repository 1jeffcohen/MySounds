//
//  ViewController.swift
//  MySounds
//
//  Created by jeff cohen on 9/17/15.
//  Copyright (c) 2015 JBC. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var seinfeld_files = [ "sdingo", "sfpret", "sfsoup", "versoph" ]
    
    var backToTheFuture_files = [ "cando90", "mayorgoldie", "thinkmcfly", "yourmom" ]
    
    var haroldAndKumar_files = [ "doogiehowser", "outofherass", "seeherboobs", "gottadoporn" ]
    
    var officeSpace_files = [ "checkoutchannel9", "ididnothing", "paperjam", "whatshappening" ]
    
    var fortyYearOldVirgin_files = [ "frenchtoast", "getonthat", "howyoutalk", "talkdirty", "yahmoburnthisplace", "kellyclarkson" ]
    
    var talladegaNights_files = [ "helpmetomcruise", "jackedup", "madethatgrace", "shakeandbake", "spidermonkey" ]
    
    var mystery_files = [ "abouttograduate", "backinside", "backtoyou", "beverage", "blue", "catalina", "cypresshill", "deafandstupid", "gangstas", "goawaybatin", "headache", "hey_bud", "huckleberry", "imeating", "joey3", "looksfake", "naked", "no-shirt", "noproblemo", "notthewholetime", "power", "prepare", "rosebud", "thatword", "thedicething" ]
    
    var last_file : String = ""

    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func volumeChanged(sender: AnyObject) {
        
        player.volume = volumeControl.value
        
    }
    
    @IBOutlet weak var volumeControl: UISlider!
    
    func playSound(file: String) {
        
        var audioPath = NSBundle.mainBundle().pathForResource(file, ofType: "mp3")
        
        if audioPath == nil {
            
            println("Unable to locate file '" + file + "'")
            
        } else {
            
            var error : NSError? = nil
        
            player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath!), error: &error)
        
            player.currentTime = 0;
        
            player.play()
            
        }
        
    }
    
    func pickSound(sounds: [String]) {
        
        var count:UInt32 = UInt32(sounds.count)
        
        var randomGuess = arc4random_uniform(count)
        
        var index = Int(randomGuess)
        
        playSound(sounds[index])
        
        last_file = sounds[index]
        
    }

    @IBAction func talladegaNights(sender: AnyObject) {
        
        pickSound(talladegaNights_files)

    }
    
    @IBAction func fortyYearOldVirgin(sender: AnyObject) {
        
        pickSound(fortyYearOldVirgin_files)

    }
    
    @IBAction func officeSpace(sender: AnyObject) {
        
        pickSound(officeSpace_files)

    }
    
    @IBAction func haroldAndKumar(sender: AnyObject) {
        
        pickSound(haroldAndKumar_files)

    }
    
    @IBAction func backToTheFuture(sender: AnyObject) {
        
        pickSound(backToTheFuture_files)

    }
    
    @IBAction func seinfeld(sender: AnyObject) {
        
        pickSound(seinfeld_files)

    }
 
    @IBAction func mystery(sender: AnyObject) {
        
        pickSound(mystery_files)
        
    }
    @IBAction func replay(sender: AnyObject) {
        
        playSound(last_file)
    
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

