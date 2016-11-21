//
//  Line.swift
//  Drawboard
//
//  Created by waltoncob on 2016/11/15.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class Line{
    private var start: CGPoint
    private var end: CGPoint
    private var color: UIColor
    private var width: CGFloat

    func getStart() -> CGPoint{
        return start
    }

    func getEnd() -> CGPoint{
        return end
    }

    func getColor() -> CGColor{
        return color.cgColor
    }

    func getColor() -> UIColor{
        return color
    }

    func getwidth() -> CGFloat{
        return width
    }
    
    init(start:CGPoint, end:CGPoint, color:UIColor!, width :CGFloat){
        self.start = start
        self.end = end
        self.color = color
        self.width = width
    }
}
