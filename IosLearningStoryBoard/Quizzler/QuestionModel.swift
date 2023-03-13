//
//  QuestionModel.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 12/03/23.
//

import Foundation

struct QuestionModel{
    let question:String
    let answer:String
    
    init(q question:String, a answer:String){
        self.question = question
        self.answer = answer
    }
}
