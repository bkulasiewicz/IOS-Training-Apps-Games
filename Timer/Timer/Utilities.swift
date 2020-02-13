//
//  Utulities.swift
//  UdemyCourse
//
//  Created by bkulasiewicz on 13/02/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import Foundation


class Utilities {
    func  getCurrentYear() -> String {
        let date = Date()
        
        let calendar = Calendar.current
        
        return String(calendar.component(.year, from: date))
    }
    
    
    //help divide letters in string 
    func getLetterIndex(str: String, location: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: location)
        
        return String(str[index])
    }
    
    
    
    func getCurrentTime() -> String {
        let date = Date()
        let forrmater = DateFormatter()
        forrmater.dateStyle = .none
        forrmater.timeStyle = .medium
        let timeString = forrmater.string(from: date)
        
        return timeString
        
    }
    
    
    
    func getRandomYear() ->String {
        return String(arc4random_uniform(8999) + 1000)
    }
    
    
}
