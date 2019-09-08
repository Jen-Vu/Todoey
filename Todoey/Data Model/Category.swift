//
//  Category.swift
//  Todoey
//
//  Created by Jonathan Tran on 8/9/19.
//  Copyright © 2019 Jen Vu. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
