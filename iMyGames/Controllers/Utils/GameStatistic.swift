//
//  GameStatistic.swift
//  iMyGames
//
//  Created by Wilton Garcia on 28/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import Foundation

class GameStatistic{
    
    let gameData = GameDataBase.shared.gameDB
    
    func numberOfGames() -> Statistic{
        
        let value = Double(gameData.count)
        
        return Statistic(statistic: Message.statistic_number_of_games, statisticValue: value)
    }
    
    func numberOfFinishedGames() -> Statistic {
        var value = 0.0
        for game in gameData{
            if(game.Finished){
                value += 1
            }
            
        }
        return Statistic(statistic: Message.statistic_number_of_finished_games, statisticValue: value)
        }
        
        
    func numberOfFavoriteGames() -> Statistic {
        var value = 0.0
        for game in gameData {
            if(!game.Favourite){
                value += 1
            }
        }
        return Statistic(statistic: Message.statistic_number_of_favorite_games, statisticValue:  value)
    }
    
    func valueOfCollection() -> Statistic{
        var value = 0.0
        for game in gameData {
            value += game.Price
        }
        return Statistic(statistic: Message.statistic_value_of_games, statisticValue: value)
    }
    
    func valueOfFinishedGames() -> Statistic{
        var value = 0.0
        for game in gameData{
            if(game.Finished){
                value += game.Price
            }
        }
        return Statistic(statistic: Message.statistic_value_of_finished_games, statisticValue: value)
    }
    
    func valueOfFavoriteGames() -> Statistic {
        var value = 0.0
        for game in gameData {
            if(game.Favourite){
                value += game.Price
            }
        }
        return Statistic(statistic: Message.statistic_vale_of_favorite_games, statisticValue: value)
    }
    
    func percentValueOfFinishedGames() -> Statistic{
        let totalOfGames = gameData.count
        var finishedGames = 0.0
        for game in gameData {
            if(game.Finished){
                finishedGames += 1
            }
        }
        let value = (finishedGames * 100.0) / Double(totalOfGames)
        return Statistic(statistic: Message.statistic_percent_of_finished_games, statisticValue: value)
        
    }
}
