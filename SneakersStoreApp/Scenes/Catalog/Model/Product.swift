//
//  Product.swift
//  SneakersStoreApp
//
//  Created by Meyram on 02.06.2023.
//

import Foundation

class Product {
    var title: String
    var description: String
    var price: Int
    var imageUrl: String
    
    init(title: String, description: String, price: Int, imageUrl: String) {
        self.title = title
        self.description = description
        self.price = price
        self.imageUrl = imageUrl
    }
}
