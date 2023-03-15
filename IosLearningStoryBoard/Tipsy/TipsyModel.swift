//
//  TipsyModel.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 15/03/23.
//

import Foundation

struct TipsyModel{
    var amount:String
    var selectedTip:Double
    var count:Double
    
    init(a amount:String,s selectedTip:Double,c count:Double){
        self.amount = amount
        self.selectedTip = selectedTip
        self.count =  count
    }

}
