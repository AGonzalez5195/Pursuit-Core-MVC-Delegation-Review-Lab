//
//  SecondViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Anthony Gonzalez on 8/19/19.
//  Copyright © 2019 Anthony Gonzalez. All rights reserved.
//
import UIKit

class SecondVC: UIViewController {
    
    //MARK: -- Outlets
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var delegate: TextSizableDelegate?
   
    
    
    //MARK: -- Actions
    @IBAction func stepperPressed(_ sender: UIStepper) {
        bottomLabel.text = sender.value.description
        bottomLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
        slider.value = Float(sender.value)
        delegate?.changeFontSize(CGFloat(sender.value))
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        bottomLabel.text = sender.value.description
        bottomLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
        stepper.value = Double(CGFloat(sender.value))
        delegate?.changeFontSize(CGFloat(Double(sender.value)))
    }
    
    //MARK: -- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stepper.minimumValue = 11.0
        self.stepper.maximumValue = 30.0
        self.slider.minimumValue = 11.0
        self.slider.maximumValue = 30.0
        bottomLabel.text = stepper.value.description
        bottomLabel.font = UIFont.systemFont(ofSize: CGFloat(stepper.minimumValue))
    }
}
