//
//  MagicBallViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 10/03/23.
//

import UIKit

class MagicBallViewController: UIViewController {

    @IBOutlet weak var questionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionImage.image = chooseImage(value: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onAskPressed(_ sender: UIButton) {
        questionImage.image = chooseImage(value: Int.random(in: 1...5))
    }
    
    func chooseImage(value:Int) -> UIImage{
        return UIImage(named: "ball\(value)")!
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
