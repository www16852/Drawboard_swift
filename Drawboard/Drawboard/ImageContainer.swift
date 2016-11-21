//
//  ImageContainer.swift
//  Drawboard
//
//  Created by waltoncob on 2016/11/16.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

class ImageContainer {
    private var preDrawViews:[UIImage] = []
    let saveLimit:Int

    private var front = -1
    private var recoveryCount = -1
    private var cancelRecoveryCount = 0

    init(saveLimit:Int,first:UIImage) {
        self.saveLimit = saveLimit
        assert(saveLimit >= 1, "saveLimit need >= 1")
        for _ in 0..<saveLimit {
            preDrawViews.append(UIImage())
        }
        push(image:first)
    }

    private func incFront(){
        if front == saveLimit-1{
            front = 0
        }else{
            front += 1
        }
        incRecoveryCount()
    }

    private func decFront(){
        if front == 0{
            front = saveLimit-1
        }else{
            front -= 1
        }
    }

    private func incRecoveryCount(){
        if recoveryCount < saveLimit-1 {
            recoveryCount += 1
        }
    }

    private func incCancelRecoveryCount(){
        if cancelRecoveryCount < saveLimit-1 {
            cancelRecoveryCount += 1
        }
    }

    func push(image:UIImage){
        incFront()
        cancelRecoveryCount = 0
        preDrawViews[front] = image
    }

    func recover(){
        if recoveryCount == 0{
            print("don't have more preDrawView")
        }else{
            recoveryCount -= 1
            decFront()
            incCancelRecoveryCount()
        }
    }

    func cancelRecover(){
        if cancelRecoveryCount == 0{
            print("don't have recovery record")
        }else{
            cancelRecoveryCount -= 1
            incFront()
            incRecoveryCount()
        }
    }

    func getNowDrawView() -> UIImage{
        return preDrawViews[front]
    }

}
