//
//  GameScene.swift
//  SpriteKitTown
//
//  Created by Cinq Technologies on 02/05/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import SpriteKit
import GameplayKit
import SKTiled

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    let car = Car(imageNamed: "Audi")
    
    var startPosition: CGPoint?
    var roadLayer: SKTileLayer?
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
//        self.anchorPoint = CGPoint(x: 0, y: 0)
        car.size = CGSize(width: 32, height: 32)
        car.zPosition = 10000
        
        if let path = Bundle.main.path(forResource: "map1", ofType: "tmx"),
            let tileMap = SKTilemap.load(tmxFile: path) {
            tileMap.zPosition = 0
            self.addChild(tileMap)
            
//            self.anchorPoint = CGPoint(x: 0, y: self.size.height)
            
            let buildingsLayer = (tileMap.getLayers(named: "Buildings") as! [SKTileLayer]).first!
            for tile in buildingsLayer.getTiles() {
                tile.zPosition = 15000
            }
            
            self.roadLayer = (tileMap.getLayers(named: "Roads") as! [SKTileLayer]).first!
            let roadTiles = roadLayer!.getTiles()
            
            self.startPosition = roadTiles.first!.position
            
            car.position = CGPoint(x: self.startPosition!.x-self.size.width/2, y: self.startPosition!.y+self.size.height/2)
            car.position = CGPoint(x: self.startPosition!.x, y: self.startPosition!.y)
            car.changeDirection(to: .south, duration: 0)
            self.addChild(car)
        }
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
//        car.changeDirection(to: .south)
        
//        let c = self.car.copy() as! SKSpriteNode
//        c.position = pos
//        c.zPosition = 10000
//        self.addChild(c)
        
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        if let _ = roadLayer?.tileAt(coord: car.front) {
            car.move(duration: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
