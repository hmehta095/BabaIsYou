//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var player:SKSpriteNode!
    let PLAYER_SPEED:CGFloat = 20
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.player = self.childNode(withName: "baba") as! SKSpriteNode
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mouseTouch = touches.first
            if(mouseTouch==nil){
                return
            }
            
            let location = mouseTouch!.location(in: self)
            
            let nodeTouched = atPoint(location).name
            print("Player touched: \(nodeTouched)")
        
        
        if (nodeTouched == "upButton"){
        self.player.position.y = self.player.position.y + PLAYER_SPEED
        }
        else if(nodeTouched == "downButton"){
        self.player.position.y = self.player.position.y - PLAYER_SPEED
        }
        else if(nodeTouched == "leftButton"){
        self.player.position.x = self.player.position.x - PLAYER_SPEED
        }
        else if(nodeTouched == "rightButton"){
        self.player.position.x = self.player.position.x + PLAYER_SPEED
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
