//
//  DestiniModel.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 13/03/23.
//

import Foundation

struct DestiniModel{
    var title:String
    var choice1: String
    var choice1Destination: Int
    var choice2: String
    var choice2Destination: Int
    
    
    
    init(title:String,choice1:String,choice1Destination:Int,choice2:String,choice2Destination:Int){
        self.title = title
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice1Destination = choice1Destination
        self.choice2Destination = choice2Destination
    }
}
