//
//  ViewController.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MonthSelectionViewDelegate {
    
    // MARK: -  Outlets
    

    @IBOutlet weak var barGraph: BarGraph!
    
    @IBOutlet weak var monthSelectionView: MonthSelectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthSelectionView.delegate = self
        monthSelectionView.selectedDate = NSDate() // set the selected date as current
    }
    
    
    // delegate
    func monthSelectionViewChangedSelectedDate(sender: MonthSelectionView, date: NSDate) {
        let startDate = DateTools.beginningOfMonth(date)
        let endDate = DateTools.addMonthsToDate(startDate, count: 1)
        
        var countArray = [Double]()
        WrittenLinesOfCodeObject.fetchDataBetween(startDate, endDate: endDate).forEach { item in
            countArray.append(Double(item.count))
        }
        self.barGraph.myBarData = countArray
        self.barGraph.reload()
    }
}

