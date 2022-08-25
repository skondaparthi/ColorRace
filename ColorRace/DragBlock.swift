//
//  DragBlock.swift
//  ColorRace
//
//  Created by Veera Kondaparthi on 7/4/22.
//

import SwiftUI

struct DragBlock: View {
    
    @State var dragOffset: CGSize = .zero
    @Binding var position: CGSize
    
    
    var body: some View {
        dragRectangle
            .offset(y: dragOffset.height + position.height)
            .gesture(DragGesture()
            .onChanged{ (value) in
                    self.dragOffset = value.translation
                    
                }
                
            .onEnded{ value in
                    self.position.height += value.translation.height
                    self.dragOffset = .zero
                    
                }
            
            )
    }
    
    var dragRectangle: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 60, height: 60)
            .position(x: 100, y: UIScreen.main.bounds.height / 2)
            .foregroundColor(.white)
    }
}

//struct DragBlock_Previews: PreviewProvider {
//    static var previews: some View {
//        DragBlock(position: $dragBlockPosition)
//    }
//}
