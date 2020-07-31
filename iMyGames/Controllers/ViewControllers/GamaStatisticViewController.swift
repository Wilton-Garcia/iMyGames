//
//  GamaStatisticViewController.swift
//  iMyGames
//
//  Created by Wilton Garcia on 28/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import UIKit

class GamaStatisticViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dataTable: UITableView!
    
    var gameData: Array<Statistic>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTable.dataSource = self
        dataTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let gs = GameStatistic()
              
        gameData = [
                  gs.numberOfGames(),
                  gs.numberOfFinishedGames(),
                  gs.numberOfFavoriteGames(),
                  gs.valueOfCollection(),
                  gs.valueOfFavoriteGames(),
                  gs.valueOfFavoriteGames()
              ]
        dataTable.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell2", for: indexPath) as! DataTableViewCell
        
        
        let statistic =   gameData[indexPath.row]
        
        cell.statistic.text = statistic.statistic
        cell.statisticValue.text = String(statistic.statisticValue)
        
        return  cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    

    

}
