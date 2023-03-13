//
//  QuizManager.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 12/03/23.
//

import Foundation

class QuizManager{
    let questionList = [
        QuizMModel(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                QuizMModel(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                QuizMModel(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                QuizMModel(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                QuizMModel(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                QuizMModel(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                QuizMModel(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                QuizMModel(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                QuizMModel(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                QuizMModel(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]
    
    private var questionNumber = 0
    private var score = 0
    
    func getQuestion() -> String{
        return questionList[questionNumber].question
    }
    
    func getScore() -> Int{
        return score
    }
    
    func getAnswerList() -> [String]{
        return questionList[questionNumber].answerList
    }
    
    func getProgress() -> Float{
        return Float(questionNumber + 1) / Float(questionList.count)
    }
    
    func checkAnswer(value:String){
        if(value == questionList[questionNumber].correctAnswer){
            score += 1
        }
        nextQuestion()
    }
    
    private func nextQuestion(){
        if(questionNumber < questionList.count - 1){
            questionNumber += 1
        }else{
            questionNumber = 0
            score = 0
        }
    }
    
    
}
