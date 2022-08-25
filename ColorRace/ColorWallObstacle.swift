//
//  ColorWallObstacle.swift
//  ColorRace
//
//  Created by Veera Kondaparthi on 7/4/22.
//

import SwiftUI

struct ColorWallObstacle: View {
        
    var body: some View {
        ZStack{
            Image("wall")
                .scaleEffect(0.4)
            VStack (spacing: 155){
                Rectangle()
                    .frame(width: 150, height: 5)
                    .foregroundColor(.green)
                Rectangle()
                    .frame(width: 150, height: 5, alignment: .center)
                    .foregroundColor(.blue)
                Rectangle()
                    .frame(width: 150, height: 5)
                    .foregroundColor(.red)
            }
            
                
        }
        
    }

    func areaWall(area:CGFloat) -> Color{
        if area < (UIScreen.main.bounds.height / 2 + 310) && area > (UIScreen.main.bounds.height / 2) + 155 {
            return Color.red
        } else if area <= (UIScreen.main.bounds.height / 2) + 155 && area >= (UIScreen.main.bounds.height / 2) {
            return Color.yellow
        } else if area < (UIScreen.main.bounds.height / 2) && area >= (UIScreen.main.bounds.height / 2) - 155 {
            return Color.green
        } else if area <= (UIScreen.main.bounds.height / 2) - 155 && area > (UIScreen.main.bounds.height / 2) - 310 {
            return Color.blue
        } else {
            return Color.clear
        }
    }

}
