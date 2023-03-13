//
//  QuizMModel.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 12/03/23.
//

import Foundation

struct QuizMModel{
    let question:String
    let answerList:[String]
    let correctAnswer:String
    
    init(q question:String, a answerList:[String], correctAnswer:String){
        self.question = question
        self.answerList = answerList
        self.correctAnswer = correctAnswer
    }
}
