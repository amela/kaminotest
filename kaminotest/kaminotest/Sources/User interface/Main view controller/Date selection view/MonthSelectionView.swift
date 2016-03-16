//
//  MonthSelectionView.swift
//  kaminotest
//
//  Created by Matic Oblak on 3/16/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class MonthSelectionView: UIView {

    @IBOutlet weak var stateMonthLabel: UILabel!
    
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
            
            self.layoutIfNeeded()
            }) { (completed) -> Void in
                newLabel.removeFromSuperview()
        }
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
            
            self.layoutIfNeeded()
            }) { (completed) -> Void in
                newLabel.removeFromSuperview()
        }
    }

    
    private func updateLabel() {
        if let month = AppState.monthStateString {
            stateMonthLabel.text = month
        }
        
    }
}
