//
//  Level.swift
//  SpriteKitTown
//
//  Created by Cinq Technologies on 02/05/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import Foundation
import SpriteKit
import SKTiled

class Level {
    
    var grid: [[SKNode]]
    
    let height = 24
    let width = 32
    
    let nodeHeight = 32
    let nodeWidth = 32
    
    init() {
        var grid = [[SKNode]]()
        
        let size = CGSize(width: nodeWidth, height: nodeHeight)
                
        for h in 0..<height {
            var row = [SKNode]()
            for w in 0..<width {
                let point = CGPoint(x: w*nodeWidth + nodeWidth/2, y: h*nodeHeight + nodeHeight/2)
                let node = SKShapeNode(rectOf: size)
                
                node.fillColor = .white
                node.strokeColor = .black
                node.position = point
                row.append(node)
            }
            grid.append(row)
        }
        
        self.grid = grid
    }
    
    
    
}
