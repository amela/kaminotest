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
        // TODO: add inject new data to the graph view
    }
}

