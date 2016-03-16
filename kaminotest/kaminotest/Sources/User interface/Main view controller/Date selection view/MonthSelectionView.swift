//
//  MonthSelectionView.swift
//  kaminotest
//
//  Created by Matic Oblak on 3/16/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

public protocol MonthSelectionViewDelegate : NSObjectProtocol {
    func monthSelectionViewChangedSelectedDate(sender: MonthSelectionView, date: NSDate)
}

public class MonthSelectionView: UIView {

    public weak var delegate: MonthSelectionViewDelegate?
    public var selectedDate = NSDate() {
        didSet {
            updateLabel()
            delegate?.monthSelectionViewChangedSelectedDate(self, date: selectedDate)
        }
    }
    
    
    @IBOutlet weak var stateMonthLabel: UILabel!
    
    // MARK: -  Button actions
    
    @IBAction func leftButton(sender: UIButton) {
        selectedDate = DateTools.addMonthsToDate(selectedDate, count: -1)
        
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
        selectedDate = DateTools.addMonthsToDate(selectedDate, count: 1)
        
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
        stateMonthLabel.text = DateTools.formateDateToMonthString(selectedDate)
    }
}
