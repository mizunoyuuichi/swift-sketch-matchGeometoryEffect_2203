// Copyright © 2022 Yuuichi Mizuno. All rights reserved.

import SwiftUI

struct MenuSelectView: View {
    
    @ObservedObject var vm = MenuSelectViewModel()
    @Namespace var namespace
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                Text("Menus")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                LazyVGrid(columns: vm.columns, spacing: 4) {
                    
                    ForEach(vm.menus, id: \.geoId) { menu in

                        Text(menu.name)
                            .panelStyle(vm.isSelected(menu) ? Color.blue : Color.gray)
                            .matchedGeometryEffect(id: menu.geoId, in: namespace)
                            .onTapGesture {
                                vm.selected(menu)
                            }
                    }
                }
                .padding(.all)
                
                Spacer()
                
                Text("Your Orders")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                LazyVGrid(columns: vm.columns, spacing: 4) {
                    
                    ForEach(vm.orders, id: \.geoId) { menu in
                        
                        Text(menu.name)
                            .panelStyle(Color.orange)
                            .matchedGeometryEffect(id: menu.geoId, in: namespace)
                            .onTapGesture {
                                vm.deselected(menu)
                            }
                    }
                }
                .padding(.all)
            }
        }
        .animation(.easeOut)
    }
}



struct MenuSelectView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSelectView()
    }
}
