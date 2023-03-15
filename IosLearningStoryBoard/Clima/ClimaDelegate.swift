//
//  ClimaDelegate.swift
//  IosLearningStoryBoard
//
//  Created by Daljeet Singh on 15/03/23.
//

import Foundation

protocol ClimaDelegate{
    func onSucess(climaResultModel:ClimaResultModel)
    func onError(message:String)
}
