//
//  ViewController.swift
//  WTStepper
//
//  Created by gsl0318@hotmail.com on 02/08/2018.
//  Copyright (c) 2018 gsl0318@hotmail.com. All rights reserved.
//

import UIKit
import WTStepper

class ViewController: UIViewController {
    
    var stepper: WTStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultButtonColor  = UIColor(red: 55/255.0, green: 143/255.0, blue: 171/255.0, alpha: 1)
        let defaultCounterColor = UIColor(red: 72/255.0, green: 195/255.0, blue: 232/255.0, alpha: 1)
        
        let stepperWidth: CGFloat  = 100
        let stepperHeight: CGFloat = 30
        let stepperX = (UIScreen.main.bounds.width / 2) - (stepperWidth / 2)
        
        stepper = WTStepper(frame: CGRect(x: stepperX, y: 80, width: stepperWidth, height: stepperHeight))
        stepper.counterTextColor = .white
        stepper.counterBackgroundColor = defaultCounterColor
        stepper.incrementButtonText = "+"
        stepper.incrementButtonTextColor = .white
        stepper.incrementButtonColor = defaultButtonColor
        stepper.decrementButtonText = "-"
        stepper.decrementButtonTextColor = .white
        stepper.decrementButtonColor = defaultButtonColor
        stepper.cornerRadius = 5
        stepper.maximum = 10
        stepper.minimum = 0
        stepper.repeatEnabled = false
        stepper.shakeEnabled  = false
        stepper.step = 1
        stepper.value = 5
        
        self.view.addSubview(stepper)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

