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
    @IBOutlet weak var barGraph: BarGraph!
    
    
    // MARK: -  Button actions
    
    @IBAction func leftButton(sender: UIButton) {
        print("month--")
        AppState.stateDate = AppState.substractMonthToDate()
        
        AppState.formateDateToMonthString()
        
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
        
       
        
        GraphDatasource.myGraphData =  GraphDatasource.getDataForMonth(4, year: 2015)
        print(GraphDatasource.myGraphData)
        
        barGraph.reload()
    }
    
    
    @IBAction func rightButton(sender: UIButton) {
        print("month++")
        AppState.stateDate = AppState.addMonthToDate()
        
        AppState.formateDateToMonthString()
        
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
        
        barGraph.reload()
    }
    
    // MARK: -  Functions
    
    func updateLabel() {
        if let month = AppState.monthStateString {
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
        
        AppState.stateDate = AppState.date
        //print(AppState.sharedstate.stateDate)
        
        AppState.formateDateToMonthString()
        self.updateLabel()
        
        AppState.dateStateChanged = self
        
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

