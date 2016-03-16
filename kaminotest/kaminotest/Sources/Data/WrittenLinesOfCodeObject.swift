//
//  WrittenLinesOfCodeObject.swift
//  kaminotest
//
//  Created by Matic Oblak on 3/16/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class WrittenLinesOfCodeObject: NSObject {
    var date = NSDate()
    var count = 0
    
    private static var mockedData: [WrittenLinesOfCodeObject]? = nil
    
    internal class func fetchDataBetween(startDate: NSDate, endDate: NSDate) -> [WrittenLinesOfCodeObject] {
        var toReturn = [WrittenLinesOfCodeObject]()
        
        if mockedData == nil {
            generateMockedData()
        }
        
        mockedData?.forEach({ item in
            if item.date.compare(startDate) != .OrderedAscending && item.date.compare(endDate) == .OrderedAscending {
                toReturn.append(item)
            }
        })
        
        return toReturn.sort({ (first, second) -> Bool in
            return first.date.compare(second.date) == .OrderedAscending
        })
    }
    
    private static func generateMockedData() {
        let startDate = DateTools.addMonthsToDate(NSDate(), count: -100) // 100 months in past
        let endDate = DateTools.addMonthsToDate(NSDate(), count: 100)  // 100 months in future
        
        var newData = [WrittenLinesOfCodeObject]()
        
        for var iterator:NSDate=DateTools.beginningOfDay(startDate); iterator.compare(endDate) == .OrderedAscending; iterator = DateTools.addDaysToDate(iterator, count: 1) {
            let item = WrittenLinesOfCodeObject()
            item.date = iterator
            item.count = Int(rand()%40000)
            newData.append(item)
        }
        
        mockedData = newData
    }
}
