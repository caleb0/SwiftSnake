//
//  ViewController2.swift
//  Snakee
//
//  Created by Vivienne Cheng on 19/08/2016.
//  Copyright © 2016 Caleb Cheng. All rights reserved.
//


import UIKit

var shouldRenderGrid = false

class ViewController2: UIViewController {

    @IBOutlet weak var renderGrid: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func renderFlipped(sender: UISwitch) {
        if renderGrid.on{
            shouldRenderGrid = true
        } else {
            shouldRenderGrid = false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
