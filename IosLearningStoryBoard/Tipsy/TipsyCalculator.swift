//
//  TipsyCalculator.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 15/03/23.
//

import Foundation

class TipsyCalculator{
    static var tipsyCalculator:TipsyCalculator?=nil
    var tipsyModel:TipsyModel?=nil
    var result:Double = 0.0
    
    static func getInstance() -> TipsyCalculator{
        if(tipsyCalculator==nil){
            tipsyCalculator = TipsyCalculator()
        }
        return tipsyCalculator!
    }
    
    func calculateTip(tipsyModel:TipsyModel){
        let amountValue:Double = Double(tipsyModel.amount)!
        let tipAmount:Double = (amountValue * tipsyModel.selectedTip) / 100.0
        self.result = (amountValue + tipAmount) / tipsyModel.count
        self.tipsyModel = tipsyModel
    }
    
    func getTipsyModel() -> TipsyModel?{
        return tipsyModel
    }
    func getResult() -> Double{
        return result
    }
    

    
    
}
