//
//  MyGamesViewController.swift
//  iMyGames
//
//  Created by Wilton Garcia on 26/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import UIKit


class MyGamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    

    
    @IBOutlet weak var MyGameTables: UITableView!
    
    
    var gameData = GameDataBase.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyGameTables.dataSource = self
        MyGameTables.delegate = self
        title = "My Games"
        // Do any additional setup after loading the view.
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MyGameTables.reloadData()
        
    }
    
    func favoriteGame(_ indexPath: IndexPath) {
        gameData.gameDB[indexPath.row].Favourite = true
       }
   
  
    //MARK: - UI Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameData.gameDB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = gameData.gameDB[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MyGameTableViewCell
        
        cell.GameName.text = game.Name
        cell.GamePlataform.text = game.Plataform
        cell.GamePrice.text = "U$ \(game.Price)"
        cell.GameImage.image = UIImage(named: game.Image)
        cell.GameFinshied.isOn = game.Finished
        
        cell.MyIndex = indexPath.row
        
        
        let favoriteImage = game.Favourite ? "star.fill" : "star"
            
       
        cell.Favorite.setImage(UIImage(systemName: favoriteImage), for:  UIControl.State.normal)
     
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

}
