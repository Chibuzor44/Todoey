//
//  Category.swift
//  Todoey
//
//  Created by Chibuzor Agubulom on 12/25/18.
//  Copyright © 2018 Chibuzor Agubulom. All rights reserved.
//

import Foundation
import RealmSwift


class Category: Object {
    @objc dynamic var name: String = ""

    let items = List<Item>()
}
