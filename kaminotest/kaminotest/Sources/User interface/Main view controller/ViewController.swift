//
//  ViewController.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MonthSelectionViewDelegate, BarGraphDataSource {
    
    // MARK: -  Outlets
    

    @IBOutlet weak var barGraph: BarGraph!
    
    @IBOutlet weak var monthSelectionView: MonthSelectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthSelectionView.delegate = self
        barGraph.dataSource = self
        
        barGraph.myScale = 30000
        
        monthSelectionView.selectedDate = NSDate() // set the selected date as current
    }
    
    
    // delegate
    func monthSelectionViewChangedSelectedDate(sender: MonthSelectionView, date: NSDate) {
        let startDate = DateTools.beginningOfMonth(date)
        let endDate = DateTools.addMonthsToDate(startDate, count: 1)
        
        self.barGraph.myBarData = WrittenLinesOfCodeObject.fetchDataBetween(startDate, endDate: endDate)
        self.barGraph.reload()
    }
    
    func barGraphValueForCustomObject(sender: BarGraph, item: AnyObject) -> Double {
        if let item = item as? WrittenLinesOfCodeObject {
            return Double(item.count)
        } else {
            return 0.0
        }
    }
}

