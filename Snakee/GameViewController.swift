//
//  GameViewController.swift
//  Snakee
//
//  Created by Caleb Cheng on 28/07/2016.
//  Copyright (c) 2016 Caleb Cheng. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    @IBOutlet weak var pauseButton: UIButton!
    var flip = true
    var myTimer = NSTimer()
    let scene = GameScene(fileNamed: "GameScene")
        override func viewDidLoad() {
        super.viewDidLoad()
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: scene!, selector: "tick", userInfo: nil, repeats: true)
            
        if (scene != nil) {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene!.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    @IBAction func onButtonPress(sender: UIButton) {
        if flip{
            pauseButton.setImage(UIImage(named: "play-button-3"), forState: .Normal)
            scene!.view?.paused = true
            myTimer.invalidate()
             
        } else {
            pauseButton.setImage(UIImage(named: "pause-2"), forState: .Normal)
            scene!.view?.paused = false
            myTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: scene!, selector: "tick", userInfo: nil, repeats: true)
        }
        
        flip = !flip
        
    }
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
