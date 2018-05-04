//
//  Car.swift
//  SpriteKitTown
//
//  Created by Cinq Technologies on 02/05/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import Foundation
import SpriteKit
import SKTiled

class Car: SKSpriteNode {
    
    let height:CGFloat = 32
    let width:CGFloat  = 32
        
    enum Direction {
        case north
        case south
        case east
        case west
        
        func rotation(to direction: Direction) -> Double {
            
            if self == direction {
                return 0
            }
            
            if (self == .north && direction == .east ||
                self == .east && direction == .south ||
                self == .south && direction == .west ||
                self == .west && direction == .north) {
                
                return -Double.pi/2
            }
            
            if (self == .north && direction == .west ||
                self == .west && direction == .south ||
                self == .south && direction == .east ||
                self == .east && direction == .north) {
                
                return Double.pi/2
            }
            
            return Double.pi
        }
    }
    
    private var direction:Direction = .north
    
    var front:CGPoint {
        switch self.direction {
        case .north:
            return CGPoint(x: self.position.x, y: (self.position.y + self.height/2) + 1)
        case .south:
            return CGPoint(x: self.position.x, y: (self.position.y - self.height/2) - 1)
        case .east:
            return CGPoint(x: (self.position.x + self.width/2) + 1, y: self.position.y)
        case .west:
            return CGPoint(x: (self.position.x - self.width/2) - 1, y: self.position.y)
        }
    }
    
    func changeDirection(to direction: Direction, duration: TimeInterval) {
        
        if direction == self.direction {
            return
        }
        
        let rotation = CGFloat(self.direction.rotation(to: direction))
        let action = SKAction.rotate(byAngle: rotation, duration:duration)
        
        self.direction = direction
        
        self.run(action)
    }
    
    func move(duration: TimeInterval) {
        
        let deltax = self.width*CGFloat(duration)
        let deltay = self.height*CGFloat(duration)
        
        let action:SKAction
        switch self.direction {
        case .north:
            action = .moveBy(x: 0, y: deltay, duration: duration)
        case .east:
            action = .moveBy(x: deltax, y: 0, duration: duration)
        case .south:
            action = .moveBy(x: 0, y: -deltay, duration: duration)
        case .west:
            action = .moveBy(x: -deltax, y: 0, duration: duration)
        }
        
        self.run(action)
    }
    
}
