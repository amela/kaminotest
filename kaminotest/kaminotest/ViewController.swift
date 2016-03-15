//
//  ViewController.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SelectedDateChanged {
    
    // MARK: -  Outlets
    
    @IBOutlet weak var stateMonthLabel: UILabel!
    
    
    // MARK: -  Button actions
    
    @IBAction func leftButton(sender: UIButton) {
        print("month--")
        AppState.sharedstate.stateDate = AppState.sharedstate.substractMonthToDate()
        
        AppState.sharedstate.formateDateToMonthString()
        
        let newLabel = UILabel(frame: stateMonthLabel.frame)
        newLabel.text = stateMonthLabel.text
        newLabel.textAlignment = stateMonthLabel.textAlignment
        newLabel.font = stateMonthLabel.font
        newLabel.textColor = stateMonthLabel.textColor
        stateMonthLabel.superview!.addSubview(newLabel)
        
        updateLabel()
        
        stateMonthLabel.frame = CGRect(x: stateMonthLabel.frame.origin.x-stateMonthLabel.frame.size.width, y: stateMonthLabel.frame.origin.y, width: stateMonthLabel.frame.size.width, height: stateMonthLabel.frame.size.height)
        
        stateMonthLabel.setNeedsLayout()
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            newLabel.frame = CGRect(x: newLabel.frame.origin.x+newLabel.frame.size.width, y: newLabel.frame.origin.y, width: newLabel.frame.size.width, height: newLabel.frame.size.height)
            
            self.view.layoutIfNeeded()
            }) { (completed) -> Void in
                newLabel.removeFromSuperview()
        }
    }
    
    
    @IBAction func rightButton(sender: UIButton) {
        print("month++")
        AppState.sharedstate.stateDate = AppState.sharedstate.addMonthToDate()
        
        AppState.sharedstate.formateDateToMonthString()
        
        let newLabel = UILabel(frame: stateMonthLabel.frame)
        newLabel.text = stateMonthLabel.text
        newLabel.textAlignment = stateMonthLabel.textAlignment
        newLabel.font = stateMonthLabel.font
        newLabel.textColor = stateMonthLabel.textColor
        stateMonthLabel.superview!.addSubview(newLabel)
        
        updateLabel()
        
        stateMonthLabel.frame = CGRect(x: stateMonthLabel.frame.origin.x+stateMonthLabel.frame.size.width, y: stateMonthLabel.frame.origin.y, width: stateMonthLabel.frame.size.width, height: stateMonthLabel.frame.size.height)
        stateMonthLabel.setNeedsLayout()
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            newLabel.frame = CGRect(x: newLabel.frame.origin.x-newLabel.frame.size.width, y: newLabel.frame.origin.y, width: newLabel.frame.size.width, height: newLabel.frame.size.height)
            
            self.view.layoutIfNeeded()
            }) { (completed) -> Void in
                newLabel.removeFromSuperview()
        }
    }
    
    // MARK: -  Functions
    
    func updateLabel() {
        if let month = AppState.sharedstate.monthStateString {
            //print(month)
            stateMonthLabel.text = month
        }
    
    }
    
    // delegate
    func changedDate() {
        updateLabel()
        print("delegate")
    }
    
    // MARK: -  Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppState.sharedstate.stateDate = AppState.sharedstate.date
        //print(AppState.sharedstate.stateDate)
        
        AppState.sharedstate.formateDateToMonthString()
        self.updateLabel()
        
        //self.SelectedDateChanged = self
        
        
        
        // for animation
        //self.stateMonthLabel.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(self.view.frame), 0.0)
        //UIView.animateWithDuration(2.0) { () -> Void in
        //    self.stateMonthLabel.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        //        self.view.frame.width/CGFloat(2)), 0)
        //}
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

