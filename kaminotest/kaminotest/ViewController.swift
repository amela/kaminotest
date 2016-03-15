//
//  ViewController.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var stateMonthLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppState.sharedstate.stateDate = AppState.sharedstate.date
        print(AppState.sharedstate.stateDate)
        
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.dateFormat = "MMMM"
        AppState.sharedstate.monthStateString = formatter.stringFromDate(AppState.sharedstate.stateDate!)
        
        
        if let month = AppState.sharedstate.monthStateString {
            print(month)
            stateMonthLabel.text = month
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

