//
//  Rhombus.swift
//  Paletta
//
//  Created by Z. Gamal on 5/19/21.
//  Copyright © 2021 Z. Gamal. All rights reserved.
//

import Foundation
import UIKit

class Rhombus {
    
    let cube: Cube
    let type: Int // Integer from 1 to 3 for color (Purple = 1, Yellow = 2, Orange = 3)
    var x: Int
    var y: Int
    var piece: Piece? = nil
    var open: Bool
    var circle: UIImageView

    
    init(cube: Cube, type: Int, x: Int, y: Int) {
        self.cube = cube
        self.type = type
        self.x = x
        self.y = y
        self.open = true
        let circleView = UIImageView(image: UIImage(named: "circle")!)
        circleView.frame = CGRect(x: x, y: y+7, width: 18, height: 18)
        self.circle = circleView
        self.circle.isHidden = true
    }
    
    func setPiece(type: Int, white: Bool) {
        piece = Piece(rhombus: self, type: type, white: white)
        open = false
    }
    
    func setPiece(piece: Piece) {
        if (self.piece != nil) {
            self.piece?.getImage().isHidden = true
        }
        self.piece = piece
        self.piece?.getImage().center.x = CGFloat(x + 10)
        self.piece?.getImage().center.y = CGFloat(y + 25/2)
        open = false
    }
    
    func getCircle() -> UIImageView {
        return self.circle
    }
    
    func toggleCircle() {
        self.circle.isHidden = !self.circle.isHidden
    }
    
    func isOpen() -> Bool {
        return self.open
    }
    
    func clear() {
        piece = nil
        open = true
    }
    
    func getPiece() -> Piece? {
        return self.piece
    }
    
    func getCube() -> Cube {
        return self.cube
    }
    
    func getType() -> Int {
        return self.type
    }
        
    
}
