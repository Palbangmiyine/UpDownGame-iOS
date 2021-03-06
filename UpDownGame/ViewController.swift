//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이수빈 on 2020/08/12.
//  Copyright © 2020 subux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        print(slider.value)
        
        tryCount += 1
        // tryCountLabel.text = String(tryCount) + "/5"
        tryCountLabel.text = "\(tryCount)/5"
        
        if randomValue == hitValue {
            //print("You HIT!!")
            showAlert(message: "You HIT!!")
            reset()
        } else if tryCount >= 5 {
            //print("You lose..")
            showAlert(message: "You lose..")
            reset()
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maxValueLabel.text = String(hitValue)
        }
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil,
                                   message: message,
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
               animated: true,
               completion: nil)
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        print("reset")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0/5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minValueLabel.text = "0"
        maxValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}

