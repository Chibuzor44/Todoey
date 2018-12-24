//
//  Item.swift
//  Todoey
//
//  Created by Chibuzor Agubulom on 12/22/18.
//  Copyright © 2018 Chibuzor Agubulom. All rights reserved.
//

import Foundation

// Instead conforming to encoder & decoder, codable does both
class Item: Codable {
    var title: String = ""
    var done: Bool = false
}
