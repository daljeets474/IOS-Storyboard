//
//  TIpsyResultViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 14/03/23.
//

import UIKit

class TIpsyResultViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefault()
        // Do any additional setup after loading the view.
    }
    
    func loadDefault(){
        let tipsyModel = TipsyCalculator.getInstance().getTipsyModel()
        if let model = tipsyModel{
            priceLabel.text = "\(String(format: "%.2f", TipsyCalculator.getInstance().getResult()))"
            messageLabel.text = "Split between \(String(format: "%.0f", model.count)) people, with \(String(format: "%.0f", model.selectedTip))% tip."
        }
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
