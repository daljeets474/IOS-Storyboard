//
//  ClimaManager.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 15/03/23.
//

import Foundation

class ClimaManager{
    
    private static let apiKey:String = "" // TODO Replace It with Your Key
    private var baseUrl:String = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric&"
    var climaDelegate:ClimaDelegate?=nil
    
    
    func getWeatherWithCityName(cityname:String){
        let url = "\(baseUrl)q=\(cityname)"
        fetchWeatherData(urlString: url)
    }
    
    func getWeatherWithLatLng(lat:Double,lng:Double){
        let url = "\(baseUrl)lat=\(lat)&lon=\(lng)"
        fetchWeatherData(urlString: url)
    }
    
    func fetchWeatherData(urlString:String){
        let url = URL(string: urlString)
        if let safeUrl = url {
            var urlRequest=URLRequest(url: safeUrl)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let e = error{
                    self.climaDelegate?.onError(message: "Error in API : \(e)")
                }
            
                if let safeData = data{
                    self.parseResponse(data: safeData)
                }
            }.resume()
        }
    }
    
    private func parseResponse(data:Data){
        do{
        let jsonDecoder = JSONDecoder()
        let climaResultModel = try jsonDecoder.decode(ClimaResultModel.self, from: data)
            self.climaDelegate?.onSucess(climaResultModel: climaResultModel)
        }catch{
            self.climaDelegate?.onError(message: "Error in Parsing : \(error)")
        }
        }
    
}
