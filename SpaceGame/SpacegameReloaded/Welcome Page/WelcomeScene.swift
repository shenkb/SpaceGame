//
//  WelcomeScene.swift
//  SpacegameReloaded
//
//  Created by Kaining on 12/01/2017.
//  Copyright © 2017 Training. All rights reserved.
//

import SpriteKit

class WelcomeScene: SKScene {

    var starfield:SKEmitterNode!
    
    var newGameButtonNode:SKSpriteNode!
    var difficultyButtonNode:SKSpriteNode!
    var diffcultyLabelNode:SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        starfield = self.childNode(withName: "starfield") as! SKEmitterNode
        starfield.advanceSimulationTime(10)
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as! SKSpriteNode
        difficultyButtonNode = self.childNode(withName: "difficultyButton") as! SKSpriteNode
        
        difficultyButtonNode.texture = SKTexture(imageNamed: "difficultyButton")
        
        diffcultyLabelNode = self.childNode(withName: "difficultyLabel") as! SKLabelNode
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "hard") {
            diffcultyLabelNode.text = "Hard"
        }else{
            diffcultyLabelNode.text = "Easy"
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton" {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                self.view!.presentScene(gameScene, transition: transition)
            } else if nodesArray.first?.name == "difficultyButton" {
                changeDifficulty()
            }
        }
        
    }
    
    func changeDifficulty() {
        
        let userDefaults = UserDefaults.standard
        
        if diffcultyLabelNode.text == "Easy" {
            diffcultyLabelNode.text = "Hard"
            userDefaults.set(true, forKey: "hard")
        } else{
            diffcultyLabelNode.text = "Easy"
            userDefaults.set(false, forKey: "hard")
        }
        
        userDefaults.synchronize()
    }
    
}

    

