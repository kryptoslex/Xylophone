//
//  ViewController.swift
//  Xylophone
//
//  Created by Michael Jay Abalos on 29/09/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var keyPlay: AVAudioPlayer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func keyPressed (sender: UIButton){
        playKeyAt(index: sender.tag)
    }

    func playKeyAt(index:Int) {
        
        let path: String? = Bundle.main.path(forResource: "note\(index)", ofType: "wav")
        if let btnPath = path {
            let urlPath: URL? = URL.init(fileURLWithPath: btnPath)
            print("urlpath = \(urlPath!)")
            
            do{
                try keyPlay = AVAudioPlayer.init(contentsOf: urlPath!)
                keyPlay.play()
                
            }catch let err as NSError{
                print("error playing = \(err.debugDescription)")
            }
        }
        
        
    }
}

