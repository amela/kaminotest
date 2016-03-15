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
    
    var barColor: UIColor = UIColor.yellowColor()
    
    var numberOfBars = 0
    var barWidth: CGFloat = 20.0
    var myBarData : [Double] = []
    
    var myScale = 20.0
    
    public func reload() {
        drawBars()
    }

    
    // private
    
    //private var previousGraphState: [AnyObject] = []
    
    
    private func drawBars() {
        if myBarData.maxElement() > myScale {
            myScale = myBarData.maxElement()!
        }
        
        
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
    
    override func awakeFromNib() {
        let dataSource = GraphDatasource()
        myBarData = dataSource.myGraphData
    }
}