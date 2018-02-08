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
        
        stepper = WTStepper(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
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
        stepper.repeatEnabled = true
        stepper.step = 1
        

        self.view.addSubview(stepper)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

