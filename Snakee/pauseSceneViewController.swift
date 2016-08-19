//
//  pauseSceneViewController.swift
//  Snakee
//
//  Created by Vivienne Cheng on 19/08/2016.
//  Copyright © 2016 Caleb Cheng. All rights reserved.
//

import UIKit

class pauseSceneViewController: UIViewController {
    var snakeHeads = ["snakehead", "snakehead1"]
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return snakeHeads.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return snakeHeads[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
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
