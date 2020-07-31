//
//  Game.swift
//  iMyGames
//
//  Created by Wilton Garcia on 24/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import Foundation

class Game:NSObject {
    let Name: String
    let Plataform: String
    let Price: Double
    var Finished: Bool
    var Favourite: Bool
    let Image: String
    
    init(Name: String, Plataform: String, Price: Double, Finished:Bool, Favourite:Bool, Image:String){
        self.Name = Name
        self.Plataform = Plataform
        self.Price = Price
        self.Finished = Finished
        self.Favourite = Favourite
        self.Image = Image
    }
}
