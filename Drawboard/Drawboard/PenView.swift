//
//  PenView.swift
//  Drawboard
//
//  Created by waltoncob on 2016/11/15.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class PenView:UIView {

    private var lines:[Line] = []
    private var lastPoint:CGPoint!
    private var drawColor:UIColor = UIColor.black
    private var drawWidth:CGFloat = 5

    func set(color:UIColor, width:CGFloat){
        drawColor = color
        drawWidth = width
    }

    func addLine(to end:CGPoint){
        lines.append(Line(start:lastPoint, end:end, color:drawColor, width:drawWidth))
    }

    func removeLines(){
        lines.removeAll()
    }

    func set(LastPoint:CGPoint){
        self.lastPoint = LastPoint
    }

    override public func draw(_ rect:CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.setLineCap(CGLineCap.round)
        for line in lines {
            context!.setLineWidth(line.getwidth())
            context!.beginPath()
            context!.move(to: line.getStart())
            context!.addLine(to: line.getEnd())
            context!.setStrokeColor(line.getColor())
            context!.strokePath()
        }
    }
    
}
