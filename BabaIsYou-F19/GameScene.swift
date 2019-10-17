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
    var stopBlock:SKSpriteNode!
    var wallBlock:SKSpriteNode!
    var isBlock:SKSpriteNode!
    var iBlock:SKSpriteNode!
    var winBlock:SKSpriteNode!
    var flagBlock:SKSpriteNode!
    var flag:SKSpriteNode!

    let PLAYER_SPEED:CGFloat = 20
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        self.flag = self.childNode(withName: "flag") as! SKSpriteNode
                
                self.flag.physicsBody = SKPhysicsBody(rectangleOf: flag.size)
                self.flag.physicsBody?.affectedByGravity = false
                self.flag.physicsBody?.categoryBitMask = 1
        //        self.flag.physicsBody?.collisionBitMask = 0
//                self.flag.physicsBody?.contactTestBitMask = 0
        
        
        
        self.player = self.childNode(withName: "baba") as! SKSpriteNode
        
        self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        self.player.physicsBody?.affectedByGravity = false
        self.player.physicsBody?.categoryBitMask = 4
//        self.player.physicsBody?.collisionBitMask = 0
//        self.player.physicsBody?.contactTestBitMask = 0
        
        self.stopBlock = self.childNode(withName: "stopblock") as! SKSpriteNode
        
        self.stopBlock.physicsBody = SKPhysicsBody(rectangleOf: stopBlock.size)
        self.stopBlock.physicsBody?.affectedByGravity = false
        self.stopBlock.physicsBody?.categoryBitMask = 8
//        self.stopBlock.physicsBody?.collisionBitMask = 0
//        self.stopBlock.physicsBody?.contactTestBitMask = 0
        
        
         self.wallBlock = self.childNode(withName: "wallblock") as! SKSpriteNode
                
                self.wallBlock.physicsBody = SKPhysicsBody(rectangleOf: wallBlock.size)
                self.wallBlock.physicsBody?.affectedByGravity = false
                self.wallBlock.physicsBody?.categoryBitMask = 16
        //        self.wallBlock.physicsBody?.collisionBitMask = 0
        //        self.wallBlock.physicsBody?.contactTestBitMask = 0
        
        self.flagBlock = self.childNode(withName: "flagblock") as! SKSpriteNode
                
                self.flagBlock.physicsBody = SKPhysicsBody(rectangleOf: wallBlock.size)
                self.flagBlock.physicsBody?.affectedByGravity = false
                self.flagBlock.physicsBody?.categoryBitMask = 256
        //        self.wallBlock.physicsBody?.collisionBitMask = 0
        //        self.wallBlock.physicsBody?.contactTestBitMask = 0
        
        
        
//        self.enumerateChildNodes(withName: "isblock") {
//            (node, stop) in
//            let isBlock = node as! SKSpriteNode
//            isBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
////            stick.physicsBody?.affectedByGravity = true
////            stick.physicsBody?.categoryBitMask = 16
//
//            isBlock.physicsBody?.affectedByGravity = false
//                           isBlock.physicsBody?.categoryBitMask = 32
//                           isBlock.physicsBody?.collisionBitMask = 0
//                           isBlock.physicsBody?.contactTestBitMask = 0
//        }
        
        
        self.isBlock = self.childNode(withName: "isblock") as! SKSpriteNode
                       
                       self.isBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
                       self.isBlock.physicsBody?.affectedByGravity = false
                       self.isBlock.physicsBody?.categoryBitMask = 32
                       self.isBlock.physicsBody?.collisionBitMask = 0
                       self.isBlock.physicsBody?.contactTestBitMask = 344
        self.iBlock = self.childNode(withName: "iblock") as! SKSpriteNode
        
        self.iBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
        self.iBlock.physicsBody?.affectedByGravity = false
        self.iBlock.physicsBody?.categoryBitMask = 32
        self.iBlock.physicsBody?.collisionBitMask = 0
        self.iBlock.physicsBody?.contactTestBitMask = 344
               
        
        self.winBlock = self.childNode(withName: "winblock") as! SKSpriteNode
        
        self.winBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
        self.winBlock.physicsBody?.affectedByGravity = false
        self.winBlock.physicsBody?.categoryBitMask = 64
//        self.winBlock.physicsBody?.collisionBitMask = 0
//        self.winBlock.physicsBody?.contactTestBitMask = 0
        
        self.enumerateChildNodes(withName: "wall") {
            (node, stop) in
            let stick = node as! SKSpriteNode
            stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
            stick.physicsBody?.affectedByGravity = false
            stick.physicsBody?.categoryBitMask = 128
            stick.physicsBody?.collisionBitMask = 0
        }
        
        
        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
                let nodeA = contact.bodyA.node
                let nodeB = contact.bodyB.node
               
               if (nodeA == nil || nodeB == nil) {
                   return
               }
               
               if(nodeA!.name == "wall" && nodeB!.name == "isblock"){
                   
                  
                print("wall and is")
               }
       
               
               if(nodeA!.name == "flag" && nodeB!.name == "baba"){
                   let winScene = WinScreen(size: self.size)
                   let transitionEffect = SKTransition.flipVertical(withDuration: 2)
                   self.view?.presentScene(winScene,transition: transitionEffect)
                  
                print("win")
               }
                if(nodeA!.name == "baba" && nodeB!.name == "flag"){
                    let winScene = WinScreen(size: self.size)
                    let transitionEffect = SKTransition.flipVertical(withDuration: 2)
                    self.view?.presentScene(winScene,transition: transitionEffect)
                    print("win")
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if (self.stopBlock.frame.intersects(self.isBlock.frame) == true){
            if(self.isBlock.frame.intersects(self.wallBlock.frame) == true){
                self.enumerateChildNodes(withName: "wall") {
                    (node, stop) in
                    let stick = node as! SKSpriteNode
                    stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
                    stick.physicsBody?.affectedByGravity = false
                    stick.physicsBody?.categoryBitMask = 128
                    stick.physicsBody?.collisionBitMask = 0
                    print("x")
                }
            }
            else {
                self.enumerateChildNodes(withName: "wall") {
                        (node, stop) in
                                   let stick = node as! SKSpriteNode
                                   stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
                                   stick.physicsBody?.affectedByGravity = false
                                   stick.physicsBody?.categoryBitMask = 0
                                   stick.physicsBody?.collisionBitMask = 0
                                   stick.physicsBody?.isDynamic=false
                   stick.physicsBody?.allowsRotation=false
                   stick.physicsBody?.allContactedBodies()
                    print("y")
            }
        }
        }else{
           self.enumerateChildNodes(withName: "wall") {
                            (node, stop) in
                            let stick = node as! SKSpriteNode
                            stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
                            stick.physicsBody?.affectedByGravity = false
                            stick.physicsBody?.categoryBitMask = 0
                            stick.physicsBody?.collisionBitMask = 0
                            stick.physicsBody?.isDynamic=false
            stick.physicsBody?.allowsRotation=false
            stick.physicsBody?.allContactedBodies()
            print("z")
            
            

        }
        }
        
        if(self.winBlock.frame.intersects(self.iBlock.frame) == true){
            if(self.flagBlock.frame.intersects(self.iBlock.frame) == true){
                self.flag.physicsBody?.contactTestBitMask = 4
//                print(true)
                self.player = self.childNode(withName: "baba") as! SKSpriteNode
                        
                        self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
                        self.player.physicsBody?.affectedByGravity = false
                        self.player.physicsBody?.categoryBitMask = 4
                        self.player.physicsBody?.collisionBitMask = 321
                //        self.player.physicsBody?.contactTestBitMask = 0
                       
                
            }
            
        }
        
        
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
