//
//  ContentView.swift
//  ColorRace
//
//  Created by Veera Kondaparthi on 7/2/22.
//

import SwiftUI
//import SceneKit

struct ContentView: View {

    
    @State var imagePosition = CGPoint(x: UIScreen.main.bounds.width - 47, y: UIScreen.main.bounds.height / 2)

    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State var score:Int = 0
    
    @State var goalColor: Color = Color.red
    
    let colorWallObstacle = ColorWallObstacle()
    
    @State var dragBlockPosition: CGSize = .zero
    

    
    
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack{
                
                // The background
                Image("game background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .edgesIgnoringSafeArea(.all)
                    .position(x: 0, y: UIScreen.main.bounds.height / 2 + 25)
                
               
                
                // The wall Image
                Image("wall")
                    .scaleEffect(0.4)
                    .position(self.imagePosition)
                    .onReceive(self.timer){_ in
                        self.moveWall()
                    }
                
                
                // Drag Block Rectangle
                DragBlock(position: $dragBlockPosition)

                
                // Navigation bar Rectangle
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 130, alignment: .topLeading)
                        .position(x: UIScreen.main.bounds.width / 2, y: 0)
                
                
                // Color to play Rectangle
                    HStack(){
                        GoalRectangle(imagePosition: $imagePosition)

                        
                        Text("\(score)")
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .light, design: .default))
                            .position(x: (UIScreen.main.bounds.width / 2) - 75 , y: 25)
                        
                    }
                }
            }
        }
        
    }
    
    func moveWall(){
        if self.imagePosition.x > -50{
            withAnimation{
                self.imagePosition.x -= 10
            }
        }
        else {
            self.imagePosition.x = 420
        }
    }
    
    
    
            
        
    
}
        
struct GoalRectangle: View {
    
    @Binding var imagePosition: CGPoint
    @State var number = 0
    @State var toggleColor = false
    
    var body: some View {
        

        if imagePosition.x == 100 {
            colorRectangle
            
        } else {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 120, height: 50, alignment: .center)
                .position(x: UIScreen.main.bounds.width / 2, y: 25)
                .foregroundColor(randomColorNumber(theNumber: number))
        }
        
        
    }
    
    var colorRectangle: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 120, height: 50, alignment: .center)
            .position(x: UIScreen.main.bounds.width / 2, y: 25)
            .foregroundColor(randomColor())
    }
    
    func randomColor() -> Color {
        let theColor = Int.random(in: 1...4)
        number = theColor
        if theColor == 1 {
            return Color.red
        } else if theColor == 2 {
            return Color.yellow
        } else if theColor == 3 {
            return Color.green
        } else {
            return Color.blue
        }
    }
    
    func randomColorNumber(theNumber:Int ) -> Color {
        number = theNumber
        if theNumber == 1 {
            return Color.red
        } else if theNumber == 2 {
            return Color.yellow
        } else if theNumber == 3 {
            return Color.green
        } else {
            return Color.blue
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
