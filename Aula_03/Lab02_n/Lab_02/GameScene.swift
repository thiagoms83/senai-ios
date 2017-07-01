//
//  GameScene.swift
//  Lab_02
//
//  Created by mobile on 01/07/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import SpriteKit
import GameplayKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
    
    
    
    #endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x * x + y * y)
    }
    
    func normalize() -> CGPoint {
        return self / length()
    }
}
class GameScene: SKScene {
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        
        let tiro = SKSpriteNode(imageNamed: "projectile")
        tiro.position = jogador.position
        
        let offset = touchLocation - tiro.position
        
        if offset.x < 0 {
            return
        }
        
        addChild(tiro)
        
        let direcao = offset.normalize()
        let qtdTiro = direcao * 1000
        let destino = qtdTiro + tiro.position
        
        let acaoMovimento = SKAction.move(to: destino, duration: 2.0)
        let acaoNaoMovimento = SKAction.removeFromParent()
        tiro.run(SKAction.sequence([acaoMovimento, acaoNaoMovimento]))
    }
    /*private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }*/
    
    let jogador = SKSpriteNode(imageNamed: "player.png")
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        jogador.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(jogador)
        
        run ( SKAction.repeatForever(SKAction.sequence ([SKAction.run {self.addMonstro()}, SKAction.wait(forDuration: 1.0)])))
    }
    
    func addMonstro() {
        let monstro = SKSpriteNode(imageNamed: "monster.png")
        let posicaoY = random(min: monstro.size.height / 2, max: size.height - monstro.size.height / 2)
        monstro.position = CGPoint (x: size.width + monstro.size.width / 2, y: posicaoY)
        addChild(monstro)
        
        let tempoVida = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let acaoMovimento = SKAction.move(to: CGPoint(x: -monstro.size.height / 2, y: posicaoY), duration: TimeInterval(tempoVida))
        let acaoNaoMovimento = SKAction.removeFromParent()
        monstro.run(SKAction.sequence([acaoMovimento, acaoNaoMovimento]))
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
}
