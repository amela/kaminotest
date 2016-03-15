//
//  BarGraph.swift
//  kaminotest
//
//  Created by amela on 15/03/16.
//  Copyright © 2016 amela. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics


class BarGraph: UIView {
    
    // public
    
    var barColor: UIColor = UIColor.purpleColor()
    
    var graphWidth = 250
    var graphHeight = -250
    
    var numberOfBars = 6
    var barWidth: CGFloat = 20.0
    
    var spaceBetweenBars = 10.0 {
        didSet {
            self.halfSpaceBetweenBars = self.spaceBetweenBars/2.0
        }
    }
    
    var myBarData = [15.7, 14.2, 5.6, 9.5, 15.4]
    
    var myScale = 20.0

    
    // private
    
    private var halfSpaceBetweenBars = 5.0
    
    //private var previousGraphState: [AnyObject] = []
    
    
    func drawBars() {
        let context = UIGraphicsGetCurrentContext()
        
        var x = CGFloat(0)
        var y = CGFloat(self.frame.height)
        
        
        var bWidth = self.frame.width
        
        
        var s = bWidth/CGFloat(myBarData.count)
        
        x = x + s/CGFloat(2) - barWidth/CGFloat(2)
        
        for i in 0...myBarData.count-1 {
            
            var scaleY = y/CGFloat(myScale)*CGFloat(myBarData[i])
            
            CGContextAddRect(context, CGRect(x: x, y: y, width: 20, height: -scaleY))
            CGContextSetFillColorWithColor(context, barColor.CGColor)
            CGContextFillPath(context)
            
            x = x + s
        }
    }
    

    
    override func drawRect(rect: CGRect) {
        drawBars()
        
    
    }
    
    
}