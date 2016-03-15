//
//  ViewController.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -  Outlets
    
    @IBOutlet weak var stateMonthLabel: UILabel!
    
    
    // MARK: -  Button actions
    
    @IBAction func leftButton(sender: UIButton) {
        print("month--")
        AppState.sharedstate.stateDate = AppState.sharedstate.substractMonthToDate()
        
        AppState.sharedstate.formateDateToMonthString()
        
        updateLabel()
    }
    
    
    @IBAction func rightButton(sender: UIButton) {
        print("month++")
        AppState.sharedstate.stateDate = AppState.sharedstate.addMonthToDate()
        
        AppState.sharedstate.formateDateToMonthString()
        
        updateLabel()

        
    }
    
    // MARK: -  Functions
    
    func updateLabel() {
        if let month = AppState.sharedstate.monthStateString {
            //print(month)
            stateMonthLabel.text = month
        }
    
    }
    
    // MARK: -  Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppState.sharedstate.stateDate = AppState.sharedstate.date
        //print(AppState.sharedstate.stateDate)
        
        AppState.sharedstate.formateDateToMonthString()
        self.updateLabel()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

