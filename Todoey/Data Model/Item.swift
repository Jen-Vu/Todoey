//
//  Item.swift
//  Todoey
//
//  Created by Jonathan Tran on 8/9/19.
//  Copyright © 2019 Jen Vu. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated: Date?
   var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
