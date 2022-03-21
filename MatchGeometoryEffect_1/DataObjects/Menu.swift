// Copyright © 2022 Yuuichi Mizuno. All rights reserved.

import Foundation

class Menu : Identifiable {
    
    var id   : Int,
        name : String
    var geoId: Int = UUID().uuidString.hash
    
    init(id: Int, name: String, geoId: Int?=nil) {
        self.id = id
        self.name = name
        if let geoId = geoId {
            self.geoId = geoId
        }
    }
    
    func copy() -> Menu {
        Menu(id: id, name: name)
    }
    
    func clone() -> Menu {
        Menu(id: id, name: name, geoId: geoId)
    }
}
