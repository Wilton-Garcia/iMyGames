//
//  GameDataBase.swift
//  iMyGames
//
//  Created by Wilton Garcia on 26/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import Foundation

class GameDataBase {
    
    static var shared = GameDataBase()
    
    private init(){
        
    }
    
    var gameDB = [
        Game(Name: "Donkey Kong Country 3", Plataform: "Super Nintendo", Price: 80.00, Finished: true, Favourite: false,Image:  "dk3"),
        Game(Name: "Super Mario World", Plataform: "Super Nintendo", Price: 70.00, Finished: true, Favourite: true,Image:  "supermario"),
        Game(Name: "Minecraft", Plataform: "Playstation 4", Price: 70.00, Finished: false, Favourite: false, Image: "minecraft"),
        Game(Name: "Donkey Kong Country 2", Plataform: "Super Nintendo", Price: 60.00, Finished: false, Favourite: false, Image:  "dk2"),
        Game(Name: "Super Metroid", Plataform: "Super Nintendo", Price: 100.00, Finished: true, Favourite: false,Image:  "metroid")
    ]
    
    
    func favoriteGame(index:Int){
        gameDB[index].Favourite.toggle()
    }
    
    func finishGame(index: Int) {
        gameDB[index].Finished.toggle()
    }
    
    
    func loadGameDataBase() -> Array<Game> {
        return gameDB
    }
    
    func insertIntoDataBase(_ game: Game){
        gameDB.append(game)
    }
    
    func printLastName(){
        print(gameDB[gameDB.count - 1].Name)
    }
    func printAll(){
        for game in gameDB {
            print(game.Name)
        }
    }
    
    func selectFavoriteGamesFromDataBase() -> Array<Game>{
        var favoriteGames = gameDB
        favoriteGames.removeAll()
        for game in gameDB {
            if(game.Favourite){
                favoriteGames.append(game)
            }
        }
        return favoriteGames
    }
}
