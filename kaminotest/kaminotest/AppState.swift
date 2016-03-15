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
    
        

}
