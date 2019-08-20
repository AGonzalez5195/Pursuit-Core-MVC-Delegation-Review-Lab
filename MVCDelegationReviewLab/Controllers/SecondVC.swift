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
    weak var delegate: TextSizable?
    
     //MARK: -- Actions
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
         navigationController?.dismiss(animated: true)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        let stepval = sender.value
        bottomLabel.text = sender.value.description
        bottomLabel.font = UIFont.systemFont(ofSize: CGFloat(stepval))
        slider.value = Float(sender.value)
        delegate?.changeFontSize(stepval)
    }
    
     //MARK: -- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stepper.minimumValue = 10.0
        self.stepper.maximumValue = 25.0
        self.slider.minimumValue = 10.0
        self.slider.maximumValue = 25.0
        bottomLabel.text = stepper.value.description
        bottomLabel.font = UIFont.systemFont(ofSize: CGFloat(stepper.minimumValue))
        
        
    }
    
}
