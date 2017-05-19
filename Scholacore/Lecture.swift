//
//  Lecture.swift
//  Scholacore
//
//  Created by Tarun kaushik on 17/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import Foundation

struct lecture{
    let subject:String!
    let hour:Int?
    let minute:Int?
    let StartTime:Date!
    let finishTime:Date!
    
    init(subject:String! ,Hour:Int! , Minute:Int){
    self.subject = subject
    self.hour = Hour
    self.minute = Minute
    self.StartTime = Date().dateAt(hours: Hour, minutes: Minute)
        if (minute! + 50) < 60{
            self.finishTime = Date().dateAt(hours: Hour, minutes: Minute + 50)
        }else{
        let extratime = (Minute + 50) - 60
         self.finishTime = Date().dateAt(hours: Hour + 1, minutes: extratime)
        }
    }

}
