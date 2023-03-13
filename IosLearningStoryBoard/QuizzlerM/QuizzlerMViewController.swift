//
//  QuizzlerMViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 12/03/23.
//

import UIKit

class QuizzlerMViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    
    
    var quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        quizManager.checkAnswer(value: (sender.titleLabel?.text)!)
        loadQuestion()
    }
    
    func loadQuestion(){
        questionLabel.text = quizManager.getQuestion()
        let answerList = quizManager.getAnswerList()
        answerOne.setTitle(answerList[0], for: .normal)
        answerTwo.setTitle(answerList[1], for: .normal)
        answerThree.setTitle(answerList[2], for: .normal)
        scoreLabel.text = "Score : \(quizManager.getScore())"
        progressBar.setProgress(quizManager.getProgress(), animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
