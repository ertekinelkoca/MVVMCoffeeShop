//
//  Order.swift
//  MVVMCoffeeShop
//
//  Created by Ali Elkoca on 26.11.2020.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    
    case cappucino
    case latte
    case espresso
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    
    case small
    case medium
    case large
}

struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize

}
