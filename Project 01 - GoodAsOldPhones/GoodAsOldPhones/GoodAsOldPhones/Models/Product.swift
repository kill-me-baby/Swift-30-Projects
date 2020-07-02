//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by Uladzislau Volchyk on 7/2/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation

struct Product {
    var name: String
    var cellImageName: String
    var fullscreenImageName: String
    
    
    static let kMocupData: [Product] = [
        Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
        Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
        Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
        Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
    ]
}


