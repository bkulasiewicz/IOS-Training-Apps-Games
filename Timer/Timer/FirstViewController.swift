//
//  FirstViewController.swift
//  UdemyCourse
//
//  Created by bkulasiewicz on 12/02/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var timer = Timer()

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let year = Utilities().getCurrentYear()
        //divide numres of year on single numbers
        label1.text = Utilities().getLetterIndex(str: year, location: 0)
        
        label2.text = Utilities().getLetterIndex(str: year, location: 1)

        label3.text = Utilities().getLetterIndex(str: year, location: 2)

        label4.text = Utilities().getLetterIndex(str: year, location: 3)
        //set timer to update text in label
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(FirstViewController.Tick), userInfo: nil, repeats: true)
        Tick()
     }
    @objc func Tick() {
        timeLabel.text = Utilities().getCurrentTime()
        //animation background change value of alpha
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.alpha = 0.5
        }) { (true) in
            self.view.alpha = 1
        }
        
            
    }


}

