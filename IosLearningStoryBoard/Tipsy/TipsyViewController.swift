//
//  TipsyViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 14/03/23.
//

import UIKit

class TipsyViewController: UIViewController {

    @IBOutlet weak var btZeroTip: UIButton!
    @IBOutlet weak var btTenTip: UIButton!
    @IBOutlet weak var btTwentyTip: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var amountTextField: UITextField!
    private var count = 1.0
    private var seletedTip = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDefault()
    }
    
    @IBAction func onTIpSeleted(_ sender: UIButton) {
        let title = sender.titleLabel?.text
        clearButtonBg()
        switch(title!){
        case "0%":
            btZeroTip.backgroundColor = UIColor.brown
            seletedTip = 0.0
            break
        case "10%":
            btTenTip.backgroundColor = UIColor.brown
            seletedTip = 10.0
            break
        case "20%":
            btTwentyTip.backgroundColor = UIColor.brown
            seletedTip = 20.0
            break
        default:
            clearButtonBg()
        }
    }
    
    @IBAction func onStepperChanged(_ sender: UIStepper) {
        count = sender.value
        countLabel.text = "\(String(format: "%.0f", count))"
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        if(checkvalidation()){
        TipsyCalculator.getInstance().calculateTip(tipsyModel: TipsyModel(a: amountTextField.text!, s: seletedTip, c: count))
            performSegue(withIdentifier: "gotoTipsyResult", sender: self)
        }
    }
    
    private func clearButtonBg(){
        btZeroTip.backgroundColor = UIColor.clear
        btTenTip.backgroundColor = UIColor.clear
        btTwentyTip.backgroundColor = UIColor.clear
    }
    
    private func loadDefault(){
        clearButtonBg()
        countLabel.text = "\(String(format: "%.0f", count))"
        splitStepper.value = count
    }
    
    private func checkvalidation() -> Bool{
        if let safeText = amountTextField.text{
            if(safeText.count > 0 && count >= 1){
                return true
            }else{
                return false
            }
        }
        return false
        
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

//MARK: Textfield Delegate

extension TipsyViewController : UITextFieldDelegate{
    
}
