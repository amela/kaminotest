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


public class BarGraph: UIView {
    // public
    
    var barColor: UIColor = UIColor.yellowColor()
    
    var numberOfBars = 0
    var barWidth: CGFloat = 20.0
    var myBarData = [Double]()
  
    var myScale = 20.0
    
    public func reload() {
        // drawBars() Calling drawBars directly causes an error as there is no context at this point.
        setNeedsDisplay() // this triggeres redraw and draw rect will be called again with the new data
    }

    
    // private
    
    //private var previousGraphState: [AnyObject] = []
    
    
    private func drawBars() {
        if myBarData.maxElement() > myScale {
            myScale = myBarData.maxElement()!
        }
        
        
        let context = UIGraphicsGetCurrentContext()
        
        var x = CGFloat(0)
        let y = CGFloat(self.frame.height)
        
        
        let bWidth = self.frame.width
        
        
        let s = bWidth/CGFloat(myBarData.count)
        
        x = x + s/CGFloat(2) - barWidth/CGFloat(2)
        
        for i in 0...myBarData.count-1 {
            
            let scaleY = y/CGFloat(myScale)*CGFloat(myBarData[i])
            
            CGContextAddRect(context, CGRect(x: x, y: y, width: barWidth, height: -scaleY))
            CGContextSetFillColorWithColor(context, barColor.CGColor)
            CGContextFillPath(context)
            
            x = x + s
        }
    }
    
    override public func drawRect(rect: CGRect) {
        drawBars()
    }
    
    override public func awakeFromNib() {
        let dataSource = GraphDatasource()
        myBarData = GraphDatasource.myGraphData
    }
}