//
//  Item.swift
//  Todoey
//
//  Created by Chibuzor Agubulom on 12/25/18.
//  Copyright © 2018 Chibuzor Agubulom. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
