//
//  EggTimerViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 10/03/23.
//

import UIKit

class EggTimerViewController: UIViewController {

    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let timerList = ["Hard":7.0,"Medium":5.0,"Soft":3.0]
    var count:Float = 0
    var totalProgress:Float = 0
    var timer:Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefault()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onButtonPressed(_ sender: UIButton) {
        startTimer(value: (sender.titleLabel?.text)!)
    }
    
    func loadDefault(){
        progressbar.setProgress(0.0, animated: true)
        titleLabel.text = "Choose Egg Timer"
    }
    
    func startTimer(value:String){
        switch(value){
        case "Hard" :
            titleLabel.text = "Hard Timer started"
            break;
        case "Medium" :
            titleLabel.text = "Medium Timer started"
            break;
        case "Soft" :
            titleLabel.text = "Soft Timer started"
            break;
        default:
            titleLabel.text = "Choose Egg Timer"
        }
        totalProgress = Float(timerList[value]!)
        count = 0
        startScheduler()
    }
    
    func startScheduler(){
        if let safeTimer = timer{
            safeTimer.invalidate()
        }
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateProgress), userInfo: nil, repeats: true)
           
    }
    
    @objc func updateProgress(){
        if(count <= totalProgress - 1){
            count += 1
            progressbar.setProgress(count / totalProgress, animated: true)
        }else{
            timer?.invalidate()
            titleLabel.text = "Done"
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
