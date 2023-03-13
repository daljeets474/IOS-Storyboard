//
//  DestiniViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 12/03/23.
//

import UIKit

class DestiniViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    
    var desinitManager:DestiniManager? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
       desinitManager = DestiniManager(destiniProtocol: self)
       loadDestini()
    }
    

    @IBAction func onButtonPressed(_ sender: UIButton) {
        let title = sender.titleLabel?.text
        desinitManager?.loadNextDestini(choice: title!)
    }
    
    func loadDestini(){
        let desiniModel = (desinitManager?.getDestiniModel())!
        titleLabel.text = desiniModel.title
        choiceOne.setTitle(desiniModel.choice1, for: .normal)
        choiceTwo.setTitle(desiniModel.choice2, for: .normal)
    
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


//Mark DestiniProtocol Impementation

extension DestiniViewController : DestiniProtocol{
    func choiceSeleted() {
        loadDestini()
    }
    
    
}
