//
//  SecondViewController.swift
//  UdemyCourse
//
//  Created by bkulasiewicz on 12/02/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lab1: UILabel!
    
    @IBOutlet weak var lab2: UILabel!
    
    @IBOutlet weak var lab3: UILabel!
    
    @IBOutlet weak var lab4: UILabel!
    

    @IBAction func buttonCliced(_ sender: Any) {
        let year = Utilities().getRandomYear()
        //divide numres of year on single numbers 
        lab1.text = Utilities().getLetterIndex(str: year, location: 0)
        
        lab2.text = Utilities().getLetterIndex(str: year, location: 1)
        
        lab3.text = Utilities().getLetterIndex(str: year, location: 2)
        
        lab4.text = Utilities().getLetterIndex(str: year, location: 3)
        
        //animation every single object
        AnimateObject(duration: 0.5, delay: 0, object: lab1)
        
        AnimateObject(duration: 0.5, delay: 0.2, object: lab2)
        
        AnimateObject(duration: 0.5, delay: 0.4, object: lab3)
        
        AnimateObject(duration: 0.5, delay: 0.6, object: lab4)
        

        
    }
    
    //function to animate objects
    func AnimateObject(duration: Double, delay: Double, object: UIView) {
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            object.center.x += self.view.bounds.width
            
        }) { (true) in
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

