//
//  DateTools.swift
//  kaminotest
//
//  Created by Matic Oblak on 3/16/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class DateTools: NSObject {
    
    static func addMonthsToDate(date: NSDate, count: Int) -> NSDate? {
        if let date = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: count, toDate: date, options: []) {
            return date
        } else {
            return date
        }
    }
    
    static func getMonthStringfromDate(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.dateFormat = "MMMM"
        return formatter.stringFromDate(date)
    }
    
    
    static func formateDateToMonthString(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        formatter.dateFormat = "yyyy"
        
        let currentYear = formatter.stringFromDate(NSDate())
        let stateYear = formatter.stringFromDate(date)
        
        if currentYear == stateYear {
            formatter.dateFormat = "MMMM"
            return formatter.stringFromDate(date)
            
        } else {
            formatter.dateFormat = "MMMM YYYY"
            return formatter.stringFromDate(date)
        }
    }

}
