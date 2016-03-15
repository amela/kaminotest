//
//  GraphDatasource.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import Foundation

class GraphDatasource: NSObject {

    static var myGraphData = [15.7, 14.2, 5.6, 9.5, 15.4]
    
    var myGraphData2 = []
    
    var dataDictionary : [NSDate : Double]?
    
    
    let day1 = NSDate(dateString:"2016-03-15")
    let day2 = NSDate(dateString:"2016-03-14")
    let day3 = NSDate(dateString:"2016-03-16")
    
    
    
    var myFakeData = [Double]()
    
    
    static func getDataForMonth(month: Int, year: Int) -> [Double] {
        var toReturn = [Double]()
        for var i=0; i<self.getDaysInMonth(month, year: year); i++ {
            toReturn.append(Double(rand()&10000))
        }
        return (toReturn)
    }
    
    
    
    static func getDaysInMonth(month: Int, year: Int) -> Int
    {
        let calendar = NSCalendar.currentCalendar()
        
        let startComps = NSDateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        
        let endComps = NSDateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? year + 1 : year
        
        let startDate = calendar.dateFromComponents(startComps)!
        let endDate = calendar.dateFromComponents(endComps)!
        
        let diff = calendar.components(NSCalendarUnit.Day, fromDate: startDate, toDate: endDate, options: NSCalendarOptions.MatchFirst)
        
        return diff.day
    }

    
    
    
}

extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
}

