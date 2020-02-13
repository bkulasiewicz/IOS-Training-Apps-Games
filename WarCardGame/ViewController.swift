//
//  ViewController.swift
//  WarCardGame
//
//  Created by bkulasiewicz on 29/01/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    var scorePlayer: Int = 0
    var scoreCPU: Int = 0
    
    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var ScorePlayer: UILabel!
    
    
    @IBOutlet weak var ScoreCPU: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
 
    @IBAction func ButtonTapped(_ sender: Any) {
    let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftImage.image = UIImage(named: "card\(leftNumber)")
        rightImage.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber >= rightNumber {
            scorePlayer += 1
            ScorePlayer.text = String(scorePlayer)
            
        }
        else if leftNumber <= rightNumber {
            scoreCPU += 1
            ScoreCPU.text = String(scoreCPU)
        }

    
    
    
    }

}
