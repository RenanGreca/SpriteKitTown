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
    
    enum Direction {
        case north
        case south
        case east
        case west
    }
    
    
    func changeDirection(to direction: Direction) {
        
        let action = SKAction.rotate(byAngle: CGFloat(Double.pi/2), duration:1)
        
        self.run(action)
        
    }
    
}
