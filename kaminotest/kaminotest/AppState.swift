//
//  AppState.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import Foundation

class AppState: NSObject {
    
    static let sharedstate = AppState()
    
    let date = NSDate()
    
    weak var dateStateChanged : SelectedDateChanged?
    
    var stateDate: NSDate? {
        didSet {
            self.dateStateChanged?.changedDate()
        }
    }
    
    var monthStateString: String?
    
    func addMonthToDate () -> NSDate? {
        if let stateDate = self.stateDate {
            let date = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: 1, toDate: stateDate, options: [])
            return date!
        }
        return nil
    }
    
    func substractMonthToDate () -> NSDate? {
        if let stateDate = self.stateDate {
            let date = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: -1, toDate: stateDate, options: [])
            return date!
        }
        return nil
    }
    
    func getMonthString () -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.dateFormat = "MMMM"
        AppState.sharedstate.monthStateString = formatter.stringFromDate(date)
        let monthString = formatter.stringFromDate(AppState.sharedstate.stateDate!)
        return (monthString)
    }
    
    
    func formateDateToMonthString() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.dateFormat = "yyyy"
        
        let currentYear = formatter.stringFromDate(AppState.sharedstate.date)
        let stateYear = formatter.stringFromDate(AppState.sharedstate.stateDate!)
        
        if currentYear == stateYear {
            formatter.dateFormat = "MMMM"
            AppState.sharedstate.monthStateString = formatter.stringFromDate(AppState.sharedstate.stateDate!)
        
        } else {
            formatter.dateFormat = "MMMM YYYY"
            AppState.sharedstate.monthStateString = formatter.stringFromDate(AppState.sharedstate.stateDate!)
        }
    }
}
