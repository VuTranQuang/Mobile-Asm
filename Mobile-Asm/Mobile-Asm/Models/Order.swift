//
//  Order.swift
//  Mobile-Asm
//
//  Created by tran.quang.vu on 23/02/2024.
//

import UIKit

struct Order {
    var medal: String
    var numberOfPeople: Int
    var restaurent: String
    var dishe: [Dishes]
    
    init(medal: String, numberOfPeople: Int, restaurent: String = "", dishe: [Dishes] = []) {
        self.medal = medal
        self.numberOfPeople = numberOfPeople
        self.restaurent = restaurent
        self.dishe = dishe
    }
    
}

struct Dishes {
    var name: String
    var numberOfDishe: Int
}
