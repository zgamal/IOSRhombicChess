//
//  Cube.swift
//  Paletta
//
//  Created by Z. Gamal on 5/19/21.
//  Copyright © 2021 Z. Gamal. All rights reserved.
//

import Foundation
import UIKit

class Cube {
    
    var rhombuses: Array<Rhombus> = Array()

    let type: Int //(1 = py, 2 = oy, 3 = po, 4 = full)
    var x: Int
    var y: Int
    var r: Int
    var c: Int
    let game: Game
    
    init(r: Int, c: Int, game: Game, x: Int, y: Int, type: Int) {
        self.game = game
        self.type = type
        self.x = x
        self.y = y
        self.r = r
        self.c = c
        if (type == 1) {
            let purple = Rhombus(cube: self, type: 1, x: game.getPieceLocationX(cube: self, type: 1), y: game.getPieceLocationY(cube: self, type: 1))
            let yellow = Rhombus(cube: self, type: 2, x: game.getPieceLocationX(cube: self, type: 2), y: game.getPieceLocationY(cube: self, type: 2))
            rhombuses.append(purple)
            rhombuses.append(yellow)

        } else if (type == 2) {
            let yellow = Rhombus(cube: self, type: 2, x: game.getPieceLocationX(cube: self, type: 2), y: game.getPieceLocationY(cube: self, type: 2))
            let orange = Rhombus(cube: self, type: 3, x: game.getPieceLocationX(cube: self, type: 3), y: game.getPieceLocationY(cube: self, type: 3))
            rhombuses.append(yellow)
            rhombuses.append(orange)
            
        } else if (type == 3) {
            let purple = Rhombus(cube: self, type: 1, x: game.getPieceLocationX(cube: self, type: 1), y: game.getPieceLocationY(cube: self, type: 1))
            let orange = Rhombus(cube: self, type: 3, x: game.getPieceLocationX(cube: self, type: 3), y: game.getPieceLocationY(cube: self, type: 3))
            rhombuses.append(purple)
            rhombuses.append(orange)
            
        } else {
            let purple = Rhombus(cube: self, type: 1, x: game.getPieceLocationX(cube: self, type: 1), y: game.getPieceLocationY(cube: self, type: 1))
            let yellow = Rhombus(cube: self, type: 2, x: game.getPieceLocationX(cube: self, type: 2), y: game.getPieceLocationY(cube: self, type: 2))
            let orange = Rhombus(cube: self, type: 3, x: game.getPieceLocationX(cube: self, type: 3), y: game.getPieceLocationY(cube: self, type: 3))
            rhombuses.append(purple)
            rhombuses.append(yellow)
            rhombuses.append(orange)
        }
    }
    
    func getPurple() -> Rhombus? {
        for rhombus in rhombuses {
            if rhombus.getType() == 1 {
                return rhombus
            }
        }
        return nil
    }
    
    func getType() -> Int {
        return self.type
    }
    
    func getGame() -> Game {
        return self.game
    }
    
    func getYellow() -> Rhombus? {
        for rhombus in rhombuses {
            if rhombus.getType() == 2 {
                return rhombus
            }
        }
        return nil
    }
    
    func getOrange() -> Rhombus? {
        for rhombus in rhombuses {
            if rhombus.getType() == 3 {
                return rhombus
            }
        }
        return nil
    }
    
    func getX() -> Int {
        return x
    }
    
    func getY() -> Int {
        return y
    }

    func getRhombuses() -> Array<Rhombus> {
        return self.rhombuses
    }
    
    func getR() -> Int {
        return r
    }
    
    func getC() -> Int {
        return c
    }
    
}
