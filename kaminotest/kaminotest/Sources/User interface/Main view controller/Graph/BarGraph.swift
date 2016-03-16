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

public protocol BarGraphDataSource : NSObjectProtocol {
    func barGraphValueForCustomObject(sender: BarGraph, item: AnyObject) -> Double
}


public class BarGraph: UIView {
    // public

    weak var dataSource: BarGraphDataSource?
    
    var barColor: UIColor = UIColor.yellowColor()
    
    var numberOfBars = 0
    var barWidth: CGFloat = 5.0
    var myBarData = [AnyObject]()
  
    var myScale = 20.0
    
    public func reload() {
        // drawBars() Calling drawBars directly causes an error as there is no context at this point.
        setNeedsDisplay() // this triggeres redraw and draw rect will be called again with the new data
    }

    
    // private
    
    //private var previousGraphState: [AnyObject] = []
    
    
    private func drawBars() {
        if myBarData.count == 0 {
            return // can not draw if no elements are present
        }
        
        let context = UIGraphicsGetCurrentContext()
        
        var x = CGFloat(0)
        let y = CGFloat(self.frame.height)
        
        
        let bWidth = self.frame.width
        
        
        let s = bWidth/CGFloat(myBarData.count)
        
        x = x + s/CGFloat(2) - barWidth/CGFloat(2)
        
        myBarData.forEach { item in
            let value = dataSource?.barGraphValueForCustomObject(self, item: item) ?? 0.0
            let scaleY = y/CGFloat(myScale)*CGFloat(value)
            
            CGContextAddRect(context, CGRect(x: x, y: y, width: barWidth, height: -scaleY))
            CGContextSetFillColorWithColor(context, barColor.CGColor)
            CGContextFillPath(context)
            
            x = x + s
        }
    }
    
    override public func drawRect(rect: CGRect) {
        drawBars()
    }
    
}