//
//  ViewController.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SelectedDateChanged {
    
    // MARK: -  Outlets
    

    @IBOutlet weak var barGraph: BarGraph!
    
    
    
    // delegate
    func changedDate() {
        // TODO: add inject new data to the graph view
    }
    
    // MARK: -  Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppState.stateDate = AppState.date
        //print(AppState.sharedstate.stateDate)
        
        AppState.formateDateToMonthString()
        
        AppState.dateStateChanged = self
        
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

