//
//  WinScreen.swift
//  BabaIsYou-F19
//
//  Created by Himanshu Mehta on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import SpriteKit

class WinScreen:SKScene{
    
     override init(size: CGSize) {
           super.init(size: size)
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func didMove(to view: SKView) {
           let background = SKSpriteNode(imageNamed: "win")
           background.position = CGPoint(x:size.width/2 , y: size.height/2)
           addChild(background)
       }
       
       override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           let mainGameScreen = GameScene(size: self.size)
           self.view?.presentScene(mainGameScreen)
       }
}
