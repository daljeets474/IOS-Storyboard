//
//  DiceeRollViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 10/03/23.
//

import UIKit

class DiceeRollViewController: UIViewController {

    @IBOutlet weak var diceOne: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefault()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onRollPressed(_ sender: UIButton) {
        diceOne.image = chooseDiceImage(value: Int.random(in: 1...6))
        diceTwo.image = chooseDiceImage(value: Int.random(in: 1...6))
    }
    
    
    func loadDefault(){
        diceOne.image = chooseDiceImage(value: 1)
        diceTwo.image = chooseDiceImage(value: 2)
    }
    
    func chooseDiceImage(value:Int) -> UIImage{
            return UIImage(named: "dice\(value)")!
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
