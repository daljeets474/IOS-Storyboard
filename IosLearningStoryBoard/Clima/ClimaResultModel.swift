//
//  ClimaResultModel.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 15/03/23.
//

import Foundation

class ClimaResultModel:Codable{
    var name:String
    var coord:CoordinateModel
    var weather: [WeatherDetailModel]
    var main:TemPeratureModel
}

class CoordinateModel:Codable{
    var lon: Double
    var lat:Double
}

class WeatherDetailModel:Codable{
    var id:Int
    var main: String
    var description:String
    var icon: String
}

class TemPeratureModel:Codable{
    var temp:Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}


