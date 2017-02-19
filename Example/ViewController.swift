//
//  ViewController.swift
//  Drawboard
//
//  Created by waltoncob on 2016/11/15.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit
import Drawboard

class ViewController: UIViewController {

    @IBOutlet weak var board: UIView!
    var drawView:DrawView!

    @IBAction func recover(_ sender: UIButton) {
        drawView.recover()
    }
   
    @IBAction func cencelRecover(_ sender: UIButton) {
        drawView.cancelRecover()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        drawView.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawView = DrawView(frame:board.frame, recordCounts:3)
        view.addSubview(drawView)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

