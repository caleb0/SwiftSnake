//
//  Grid.swift
//  Snakee
//
//  Created by Caleb Cheng on 28/07/2016.
//  Copyright © 2016 Caleb Cheng. All rights reserved.
//

import Foundation

import SpriteKit


// my grid class is beast


class Grid:SKSpriteNode {
    var rows:Int!
    var cols:Int!
    var blockSize:CGFloat!
    
    convenience init(blockSize:CGFloat,rows:Int,cols:Int, renderGrid: Bool) {
        let texture = Grid.gridTexture(blockSize,rows: rows, cols:cols, renderGrid: renderGrid)
        self.init(texture: texture, color:SKColor.clearColor(), size: texture.size())
        self.blockSize = blockSize
        self.rows = rows
        self.cols = cols
    }
    
    override init(texture: SKTexture!, color: SKColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func gridTexture(blockSize:CGFloat,rows:Int,cols:Int, renderGrid: Bool) -> SKTexture {
        // Add 1 to the height and width to ensure the borders are within the sprite
        let size = CGSize(width: CGFloat(cols)*blockSize+1.0, height: CGFloat(rows)*blockSize+1.0)
        UIGraphicsBeginImageContext(size)
        
        let context = UIGraphicsGetCurrentContext()
        let bezierPath = UIBezierPath()
        let offset:CGFloat = 0.5
        if renderGrid {
            // Draw vertical lines
            for i in 0...cols {
                let x = CGFloat(i)*blockSize + offset
                bezierPath.moveToPoint(CGPoint(x: x, y: 0))
                bezierPath.addLineToPoint(CGPoint(x: x, y: size.height))
            }
            // Draw horizontal lines
            for i in 0...rows {
                let y = CGFloat(i)*blockSize + offset
                bezierPath.moveToPoint(CGPoint(x: 0, y: y))
                bezierPath.addLineToPoint(CGPoint(x: size.width, y: y))
            }

        } else {
            bezierPath.moveToPoint(CGPoint(x:0, y: 0))
            bezierPath.addLineToPoint(CGPoint(x: 0, y: size.height))
            
            bezierPath.moveToPoint(CGPoint(x: CGFloat(cols) * blockSize + offset, y: 0))
            bezierPath.addLineToPoint(CGPoint(x: size.width, y: size.height))
            
            bezierPath.moveToPoint(CGPoint(x:0, y: 0))
            bezierPath.addLineToPoint(CGPoint(x: size.width, y: 0))
            
            bezierPath.moveToPoint(CGPoint(x: 0, y: CGFloat(rows)*blockSize + offset))
            bezierPath.addLineToPoint(CGPoint(x: size.width, y: size.height))
        }
        
        SKColor.greenColor().setStroke()
        bezierPath.lineWidth = 1.0
        bezierPath.stroke()
        CGContextAddPath(context, bezierPath.CGPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return SKTexture(image: image)
    }
    

    

    
    func gridPosition(row:Int, col:Int) -> CGPoint {
        let offset = blockSize / 2.0
        let x = CGFloat(col) * blockSize - (blockSize * CGFloat(cols)) / 2.0 + offset
        let y = CGFloat(rows - row - 1) * blockSize - (blockSize * CGFloat(rows)) / 2.0 + offset
        return CGPoint(x:x, y:y)
    }
    
    func isEmpty(row:Int, col:Int) -> Bool {
        return false
    }
}