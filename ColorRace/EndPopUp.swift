//
//  EndPopUp.swift
//  ColorRace
//
//  Created by Sanjan Kondaparthi on 12/7/22.
//

import SwiftUI

struct EndPopUp: View {
    var body: some View {
        let textSize:Int = 40
        var score:Int = 0
        
        ZStack{
            Image("game background")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
                .position(x: 0, y: UIScreen.main.bounds.height / 2 + 20)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 300, alignment: .center)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 50 )
                .foregroundColor(Color.black.opacity(0.75))
            
            Text("GAME OVER")
                .foregroundColor(.white)
                .font(.system(size: CGFloat(textSize), weight: .medium, design: .default))
                .position(x: (UIScreen.main.bounds.width / 2) , y: UIScreen.main.bounds.height/4 + CGFloat(textSize) + 20)
            
            Text("Your Score: " + "\(score)")
                .foregroundColor(.white)
                .font(.system(size: CGFloat(30), weight: .light, design: .default))
                .position(x: (UIScreen.main.bounds.width / 2) , y: UIScreen.main.bounds.height/4 + CGFloat(textSize) + 80)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 120, height: 50, alignment: .center)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 25 )
                .foregroundColor(Color.blue)
            
            HStack {
                Button("Play Again") {
                    print("Button pressed!")
                }
                    .padding()
                    .background(Color.white)
                    .clipShape(Capsule())
                .position(x: UIScreen.main.bounds.width/2 - 65, y: UIScreen.main.bounds.height / 2 + 50)
                
                Button("Share") {
                    print("Button pressed!")
                }
                    .padding()
                    .background(Color.white)
                    .clipShape(Capsule())
                .position(x: UIScreen.main.bounds.width/2 - 125, y: UIScreen.main.bounds.height / 2 + 50)
            }
        }
    }
}

struct EndPopUp_Previews: PreviewProvider {
    static var previews: some View {
        EndPopUp()
    }
}
