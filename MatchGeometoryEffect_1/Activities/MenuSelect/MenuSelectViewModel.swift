// Copyright © 2022 Yuuichi Mizuno. All rights reserved.

import SwiftUI
import Combine

final class MenuSelectViewModel: ObservableObject {
    
    @Published var menus : [Menu] = [
        Menu(id:  1, name: "piza"),
        Menu(id:  2, name: "tacos"),
        Menu(id:  3, name: "pasta"),
        Menu(id:  4, name: "chicken and rice"),
        Menu(id:  5, name: "pilaf"),
        Menu(id:  6, name: "chicken gebab"),
        Menu(id:  7, name: "Indian curry"),
        Menu(id:  8, name: "samosa"),
        Menu(id:  9, name: "Turkish Pizza"),
        Menu(id: 10, name: "chai"),
        Menu(id: 11, name: "Turkish Coffee"),
        Menu(id: 12, name: "espresso")
    ]
    
    @Published var orders : [Menu] = []
    
    var columns = Array(repeating: GridItem(.flexible()), count: 4)
}



// MARK: - public
extension MenuSelectViewModel {
    
    func isSelected(_ menu: Menu) -> Bool  {
        orders.contains(where: {$0.id == menu.id})
    }
    
    func selected(_ menu: Menu) {
        let master = menu.copy()
        if let index = menus.firstIndex(where: {$0.id == menu.id}) {
            menus[index] = master
        }
        
        orders.insert(menu, at: 0)
    }
    
    func deselected(_ menu: Menu) {
        if let index = orders.firstIndex(where: {$0.id == menu.id}) {
            orders.remove(at: index)
        }
    }
}
