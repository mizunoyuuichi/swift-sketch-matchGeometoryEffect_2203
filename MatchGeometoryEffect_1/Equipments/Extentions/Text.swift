import SwiftUI

extension Text {
    
    func panelStyle(_ backgroundColor: SwiftUI.Color? = nil) -> AnyView {
        AnyView(foregroundColor(.white)
                .fontWeight(.bold)
                .frame(width: 88, height: 88)
                .background(backgroundColor ?? .gray)
                .cornerRadius(15))
    }
}
