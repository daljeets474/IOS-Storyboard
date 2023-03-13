//
//  ViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 10/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appTableView: UITableView!
    
    let reusableIdentifier = "appListreuableCell"
    let reusableCellClass = "CustomHomeTableViewCell"
    var appList:[AppListModel] = [
    AppListModel(t: "I AM RICH", i: "iamrich"),
    AppListModel(t: "I AM POOR", i: "iampoor"),
    AppListModel(t: "DICEE ROLL", i: "diceeroll"),
    AppListModel(t: "MAGIC 8 BALL", i: "magicball"),
    AppListModel(t: "CALCULATOR", i: "calculator"),
    AppListModel(t: "XYLOPHONE", i: "xylophone"),
    AppListModel(t: "EGG TIMER", i: "eggtimer"),
    AppListModel(t: "QUIZZLER", i: "quizzler"),
    AppListModel(t: "QUIZM", i: "quizzler"),
    AppListModel(t: "DESTINI", i: "destini")
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        appTableView.dataSource = self
        appTableView.delegate = self
        appTableView.register(UINib(nibName: reusableCellClass, bundle: nil), forCellReuseIdentifier: reusableIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.navigationBar.isHidden =  true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //navigationController?.navigationBar.isHidden =  false
    }
    
    func navigateToScreen(title:String){
        switch(title){
            
        case "I AM RICH" :
            performSegue(withIdentifier: "goToIAmRich", sender: self)
            break
            
        case "I AM POOR":
            performSegue(withIdentifier: "gotoIAmPoor", sender: self)
            break
            
        case "DICEE ROLL":
            performSegue(withIdentifier: "gotoDiceeRoll", sender: self)
            break
            
        case "MAGIC 8 BALL":
            performSegue(withIdentifier: "gotoMagicBall", sender: self)
            break
            
        case "CALCULATOR":
            performSegue(withIdentifier: "gotoCalculator", sender: self)
            break
            
        case "XYLOPHONE":
            performSegue(withIdentifier: "gotoXylophone", sender: self)
            break
            
        case "EGG TIMER":
            performSegue(withIdentifier: "gotoEggTimer", sender: self)
            break
            
        case "QUIZZLER":
            performSegue(withIdentifier: "gotoQuizzler", sender: self)
            break
            
        case "QUIZM":
            performSegue(withIdentifier: "gotoQuizm", sender: self)
            break
            
        case "DESTINI":
            performSegue(withIdentifier: "gotoDestini", sender: self)
            break
            
        default:
            break
        }
    }


}


//Mark table View Data source Delegate

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomHomeTableViewCell = self.appTableView.dequeueReusableCell(withIdentifier: reusableIdentifier) as! CustomHomeTableViewCell
        cell.selectionStyle = .none
        let appListModel = appList[indexPath.row]
        cell.titleLabel.text = appListModel.title
        cell.titleImage.image = UIImage(named: appListModel.imageName)
        return cell
    }
    
}


//Mark table View Delegates

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appListModel = appList[indexPath.row]
        print(appListModel.title)
        navigateToScreen(title: appListModel.title)
    }
}

