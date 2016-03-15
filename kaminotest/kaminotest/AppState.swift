//
//  AppState.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import Foundation

class AppState {
    
    static let sharedstate = AppState()
    
    let date = NSDate()
    
    var stateDate: NSDate?
    
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
        formatter.dateFormat = "MMMM"
        AppState.sharedstate.monthStateString = formatter.stringFromDate(AppState.sharedstate.stateDate!)

    }
}
