//
//  DrawView.swift
//  Drawboard
//
//  Created by waltoncob on 2016/11/15.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class DrawView:UIView {

    private var drawColor = UIColor.black
    private var drawWidth:CGFloat = 5
    
    private var penView:PenView!
    private var newDrawView:UIImageView!
    private var drawRecord:ImageContainer!


    public init(frame:CGRect, background:UIColor = UIColor.white, recordCounts:Int = 1){
        super.init(frame: frame)
        self.drawRecord = ImageContainer(saveLimit:recordCounts, first:makeScreenshot())
        self.backgroundColor = background
        self.penView = PenView(frame:self.bounds)
        self.newDrawView = UIImageView(frame:self.bounds)
        setupPreDrawView()
        setupPenView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPenView(){
        penView.backgroundColor = UIColor.clear
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(self.panDrawView(gesture:)))
        penView.addGestureRecognizer(panGR)
        self.addSubview(penView)
    }

    private func setupPreDrawView(){
        newDrawView.backgroundColor = UIColor.clear
        self.addSubview(newDrawView)
    }

    private func saveDrawView(image:UIImage){
        drawRecord.push(image:image)
    }

    public func recover(){
        penView.setNeedsDisplay()
        drawRecord.recover()
        newDrawView.image = drawRecord.getNowDrawView()
    }

    public func cancelRecover(){
        penView.setNeedsDisplay()
        drawRecord.cancelRecover()
        newDrawView.image = drawRecord.getNowDrawView()
    }

    func makeScreenshot() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        let context = UIGraphicsGetCurrentContext()
        self.layer.render(in:context!)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }

    //MARK: get set

    public func set(drawColor:UIColor, width:CGFloat){
        self.drawColor = drawColor
        self.drawWidth = width
    }

    //MARK: target

    func panDrawView(gesture:UIPanGestureRecognizer){
        switch gesture.state{
        case .began:
            let newPoint = gesture.location(in: penView)
            penView.set(color:self.drawColor, width:self.drawWidth)
            penView.set(LastPoint:newPoint)
        case .changed:
            let newPoint = gesture.location(in: penView)
            penView.addLine(to:newPoint)
            penView.set(LastPoint:newPoint)
            penView.setNeedsDisplay()
        case .ended:
            let screenshot = makeScreenshot()
            newDrawView.image = screenshot
            saveDrawView(image: screenshot)
            penView.removeLines()
        default:break
        }
    }
    
}
