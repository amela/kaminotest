//
//  AppState.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import Foundation

class AppState: NSObject {
    
    static let date = NSDate()
    
    static weak var dateStateChanged : SelectedDateChanged?
    
    static var stateDate: NSDate? {
        didSet {
            self.dateStateChanged?.changedDate()
        }
    }
    
    static var monthStateString: String?
    
    static func addMonthToDate () -> NSDate? {
        if let stateDate = self.stateDate {
            let date = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: 1, toDate: stateDate, options: [])
            return date!
        }
        return nil
    }
    
    static func substractMonthToDate () -> NSDate? {
        if let stateDate = self.stateDate {
            let date = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: -1, toDate: stateDate, options: [])
            return date!
        }
        return nil
    }
    
    static func getMonthString () -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.dateFormat = "MMMM"
        AppState.monthStateString = formatter.stringFromDate(date)
        let monthString = formatter.stringFromDate(AppState.stateDate!)
        return (monthString)
    }
    
    
    static func formateDateToMonthString() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.dateFormat = "yyyy"
        
        let currentYear = formatter.stringFromDate(AppState.date)
        let stateYear = formatter.stringFromDate(AppState.stateDate!)
        
        if currentYear == stateYear {
            formatter.dateFormat = "MMMM"
            AppState.monthStateString = formatter.stringFromDate(AppState.stateDate!)
        
        } else {
            formatter.dateFormat = "MMMM YYYY"
            AppState.monthStateString = formatter.stringFromDate(AppState.stateDate!)
        }
    }
}
