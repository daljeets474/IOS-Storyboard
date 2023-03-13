//
//  QuizzlerViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 12/03/23.
//

import UIKit

class QuizzlerViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    
    let quizz = QuizzBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        quizz.checkAnswer(value: (sender.titleLabel?.text)!)
        loadQuestion()
    }
    
    func loadQuestion(){
        questionLabel.text = quizz.getCurrentQuestion()
        scorelabel.text = "Score : \(quizz.getScore())"
        progressBar.setProgress(quizz.getProgress(), animated: true)
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
