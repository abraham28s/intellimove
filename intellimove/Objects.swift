//
//  Direction.swift
//  intellimove
//
//  Created by Abraham Soto on 15/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import Foundation

class Direction {
    
    let name: String
    let street: String
    let zipCode: String
    let state: String
    let city: String
    let country: String
    let period: [Period]
    
    init(name: String, street: String, zipCode: String, state: String, city: String, country: String, period: [Period]) {
        self.name = name
        self.street = street
        self.zipCode = zipCode
        self.state = state
        self.city = city
        self.country = country
        self.period = period
    }
    
    func toJSON() -> String {
        var periodos = ""
        for per in self.period {
            periodos = periodos + per.toJSON()
            if per !== self.period[self.period.count-1]{
                periodos = periodos + ","
            }
        }
        var periodo = "\"period\": [\(periodos)]"
        return "{\"name\": \"\(self.name)\",\"street\": \"\(self.street)\",\"zipCode\": \"\(self.zipCode)\",\"state\": \"\(self.state)\",\"city\": \"\(self.city)\",\"country\": \"\(self.country)\",\(periodo)}";
        
    }
}


class Period {
    let day: String
    let initialTime: String
    let finalTime: String
    
    init(day:String, initialTime:String, finalTime:String) {
        self.day = day
        self.initialTime = initialTime
        self.finalTime = finalTime
    }
    
    func toJSON() -> String {
        return "{\"day\": \"\(self.day)\",\"initialTime\": \"\(self.initialTime)\",\"finalTime\": \"\(self.finalTime)\"}";
        
    }
}

class Transport {
    let _id: String
    let cost: Int
    let description: String
    let icon: String
    let maxDistance: Int
    let name: String
    
    init(_id:String,cost:Int,description:String,icon:String,maxDistance:Int,name:String) {
        self._id = _id
        self.cost = cost
        self.description = description
        self.icon = icon
        self.maxDistance = maxDistance
        self.name = name
    }
    
    func toJSON() -> String {
        return "{\"_id\": \"\(self._id)\",\"cost\": \"\(self.cost)\",\"description\": \"\(self.description)\",\"icon\": \"\(self.icon)\",\"maxDistance\": \"\(self.maxDistance)\",\"name\": \"\(self.name)\"}";
        
    }
}
