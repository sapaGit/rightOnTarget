//
//  ViewController.swift
//  rightOnTarget
//
//  Created by Sergey Pavlov on 05.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number = 0, round = 0, points = 0
    
    @IBAction func checkNumber() {
        if self.round == 0 {
                // generate random number
            self.number = Int.random(in: 1...50)
                // sending random value to label
            self.label.text = String(self.number)
                // set round counter to 1
            self.round = 1
        } else {
                //get value on slider
            let numSlider = Int(self.slider.value.rounded())
                // compare value with current and summ points
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            if self.round == 5 {
                let alert = UIAlertController(
                    title: "Game over",
                    message: "You gained \(self.points) points",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Start again", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
                //generate random number
            self.number = Int.random(in: 1...50)
                // send random to label
            self.label.text = String(self.number)
        }
    }
}
