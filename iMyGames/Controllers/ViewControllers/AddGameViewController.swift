//
//  AddGameViewController.swift
//  iMyGames
//
//  Created by Wilton Garcia on 28/07/20.
//  Copyright © 2020 Wilton-Garcia. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Plataform: UITextField!
    
    @IBOutlet weak var Price: UITextField!
    
    @IBOutlet weak var Finshed: UISwitch!
    
    @IBAction func AddGame(_ sender: Any) {
        
        
        if let name = Name.text, let plataform = Plataform.text, let priceString = Price.text{
            if let price = Double(priceString){
                let game = Game(Name: name,
                                Plataform: plataform,
                                Price: price,
                                Finished: Finshed.isOn,
                                Favourite: false,
                                Image: " ")
                
                GameDataBase.shared.insertIntoDataBase(game)
          
                
            }
        }
        
        
        
        navigationController?.popViewController(animated: true)
        
    }
}
