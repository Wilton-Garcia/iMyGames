//
//  MyGameTableViewCell.swift
//  iMyGames
//
//  Created by Wilton Garcia on 26/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import UIKit

class MyGameTableViewCell: UITableViewCell {

    @IBOutlet weak var GameName: UILabel!
    
    @IBOutlet weak var GamePlataform: UILabel!
    
    @IBOutlet weak var GamePrice: UILabel!
    
    @IBOutlet weak var GameImage: UIImageView!
    
    @IBOutlet weak var Favorite: UIButton!
    
    @IBOutlet weak var GameFinshied: UISwitch!
    
   
    var MyIndex: Int!
    
    @IBAction func FavotireGame(_ sender: Any) {
        GameDataBase.shared.favoriteGame(index: MyIndex)
        let game = GameDataBase.shared.gameDB[MyIndex]
        
        let favoriteImage = game.Favourite ? "star.fill" : "star"
        Favorite.setImage(UIImage(systemName: favoriteImage), for:  UIControl.State.normal)
        
    }
    
    @IBAction func FinishGame(_ sender: Any) {
        GameDataBase.shared.finishGame(index: MyIndex)
    }
}
