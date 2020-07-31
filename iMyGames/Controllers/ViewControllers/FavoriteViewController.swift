//
//  FavoriteViewController.swift
//  iMyGames
//
//  Created by Wilton Garcia on 29/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
  
    @IBOutlet weak var searchGameBar: UISearchBar!
    var favoriteGames:[Game] = []
    var filteredFavoriteGames:[Game] = []
       
    @IBOutlet weak var favoriteGameCollection: UICollectionView!
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
        favoriteGameCollection.dataSource = self
        favoriteGameCollection.delegate = self
        searchGameBar.delegate = self
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteGames = GameDataBase.shared.selectFavoriteGamesFromDataBase()
        filteredFavoriteGames = favoriteGames
        favoriteGameCollection.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredFavoriteGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoriteCollectionViewCell
        
        let game = filteredFavoriteGames[indexPath.row]
        
        cell.gameImage.image = UIImage(named: game.Image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 175, height: 175)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredFavoriteGames = searchText.isEmpty ? favoriteGames : favoriteGames.filter{$0.Name.lowercased().contains(searchText.lowercased())}
        
        favoriteGameCollection.reloadData()
    }
    
    
    
    
    

   
    
}
