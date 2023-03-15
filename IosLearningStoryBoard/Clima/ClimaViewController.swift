//
//  ClimaViewController.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 15/03/23.
//

import UIKit
import CoreLocation

class ClimaViewController: UIViewController {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityNameTextField: UITextField!
    
    let locationManager = CLLocationManager()
    var climamanager = ClimaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameTextField.delegate = self
        locationManager.delegate = self
        climamanager.climaDelegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBAction func onGetLocationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    @IBAction func onSearchLocationPressed(_ sender: UIButton) {
        if let cityName = cityNameTextField.text{
            fetchLocation(cityName: cityName)
        }
    }

    func fetchLocation(cityName:String){
        climamanager.getWeatherWithCityName(cityname: cityName)
    }
}


//MARK: - TextField Delegate
extension ClimaViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let cityName = cityNameTextField.text{
            fetchLocation(cityName: cityName)
        }
        return true
    }
}


//MARK: - Core Location Extension methods
extension ClimaViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        climamanager.getWeatherWithLatLng(lat: locations[0].coordinate.latitude, lng: locations[0].coordinate.longitude)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location")
    }
}

//MARK: - Clima Delegate
extension ClimaViewController:ClimaDelegate{
    func onSucess(climaResultModel: ClimaResultModel) {
        DispatchQueue.main.async {
            self.cityNameLabel.text =  climaResultModel.name
            self.temperatureLabel.text =   String(format: "%.0f", climaResultModel.main.temp)
            self.cityNameTextField.text = ""
            self.weatherImage.image = self.getWeatherImage(value: climaResultModel.weather[0].id)
        }
    }
    
    func onError(message: String) {
        print(message)
    }
    
    func getWeatherImage(value:Int) -> UIImage?{
        switch (value){
        case 0...200 :
            return UIImage(systemName: "cloud.bolt.rain")
            
        case 300...321 :
            return UIImage(systemName: "cloud.drizzle")
         
        case 500...531 :
            return UIImage(systemName: "cloud.heavyrain")
         
        case 600...622 :
            return UIImage(systemName: "cloud.snow")
         
        case 700...781 :
            return UIImage(systemName: "sun.haze")
         
        case 800:
            return UIImage(systemName: "sun.max")
        case 801...804:
            return UIImage(systemName: "cloud.sun")
        default:
            return UIImage(systemName: "sun.max")
        }
    }
}
