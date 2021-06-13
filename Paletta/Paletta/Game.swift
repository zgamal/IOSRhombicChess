//
//  Game.swift
//  Paletta
//
//  Created by Z. Gamal on 5/20/21.
//  Copyright © 2021 Z. Gamal. All rights reserved.
//

import Foundation
import UIKit

class Game {

    var cubes = [[Cube?]] (repeating: [Cube?](repeating: nil, count: 6), count: 6)
    var white: Bool = true
    
    init () {
        cubes[0][0] = Cube(r: 0, c: 0, game: self, x: 106, y: 647, type: 1)
        cubes[0][1] = Cube(r: 0, c: 1, game: self, x: 173, y: 647, type: 4)
        cubes[0][2] = Cube(r: 0, c: 2, game: self, x: 240, y: 647, type: 4)
        cubes[0][3] = Cube(r: 0, c: 3, game: self, x: 307, y: 647, type: 2)
        cubes[1][0] = Cube(r: 1, c: 0, game: self, x: 73, y: 590, type: 1)
        cubes[1][1] = Cube(r: 1, c: 1, game: self, x: 140, y: 590, type: 4)
        cubes[1][2] = Cube(r: 1, c: 2, game: self, x: 207, y: 590, type: 4)
        cubes[1][3] = Cube(r: 1, c: 3, game: self, x: 274, y: 590, type: 4)
        cubes[1][4] = Cube(r: 1, c: 4, game: self, x: 341, y: 590, type: 2)
        cubes[2][0] = Cube(r: 2, c: 0, game: self, x: 39, y: 533, type: 1)
        cubes[2][1] = Cube(r: 2, c: 1, game: self, x: 106, y: 533, type: 4)
        cubes[2][2] = Cube(r: 2, c: 2, game: self, x: 173, y: 533, type: 4)
        cubes[2][3] = Cube(r: 2, c: 3, game: self, x: 240, y: 533, type: 4)
        cubes[2][4] = Cube(r: 2, c: 4, game: self, x: 307, y: 533, type: 4)
        cubes[2][5] = Cube(r: 2, c: 5, game: self, x: 374, y: 533, type: 2)
        cubes[3][1] = Cube(r: 3, c: 1, game: self, x: 73, y: 476, type: 4)
        cubes[3][2] = Cube(r: 3, c: 2, game: self, x: 140, y: 476, type: 4)
        cubes[3][3] = Cube(r: 3, c: 3, game: self, x: 207, y: 476, type: 4)
        cubes[3][4] = Cube(r: 3, c: 4, game: self, x: 274, y: 476, type: 4)
        cubes[3][5] = Cube(r: 3, c: 5, game: self, x: 341, y: 476, type: 4)
        cubes[4][2] = Cube(r: 4, c: 2, game: self, x: 106, y: 419, type: 4)
        cubes[4][3] = Cube(r: 4, c: 3, game: self, x: 173, y: 419, type: 4)
        cubes[4][4] = Cube(r: 4, c: 4, game: self, x: 240, y: 419, type: 4)
        cubes[4][5] = Cube(r: 4, c: 5, game: self, x: 307, y: 419, type: 4)
        cubes[5][3] = Cube(r: 5, c: 3, game: self, x: 140, y: 362, type: 3)
        cubes[5][4] = Cube(r: 5, c: 4, game: self, x: 207, y: 362, type: 3)
        cubes[5][5] = Cube(r: 5, c: 5, game: self, x: 274, y: 362, type: 3)
    }
    
    
    func isWhite() -> Bool {
        return self.white
    }
    
    func toggleWhite() {
        self.white = !self.white
    }
    
    //functions that return relative locations of the pieces based on the cubes and rhombus they are on
    func getPieceLocationX(cube: Cube, type: Int) -> Int {
        if type == 1 { return cube.getX() + 7 }
        else if type == 2 { return cube.getX() - 10 }
        else { return cube.getX() - 29 }
    }
    
    func getPieceLocationY(cube: Cube, type: Int) -> Int {
        if type == 1 { return cube.getY() - 6 }
        else if type == 2 { return cube.getY() - 35 }
        else { return cube.getY() - 7 }
    }
    
    func getCubes() -> [[Cube?]] {
        return self.cubes
    }
    
    func buildPieces() {
        cubes[0][0]?.getPurple()?.setPiece(type: 1, white: true)
        cubes[0][1]?.getOrange()?.setPiece(type: 2, white: true)
        cubes[0][1]?.getYellow()?.setPiece(type: 5, white: true)
        cubes[0][1]?.getPurple()?.setPiece(type: 3, white: true)
        cubes[0][2]?.getOrange()?.setPiece(type: 4, white: true)
        cubes[0][2]?.getYellow()?.setPiece(type: 5, white: true)
        cubes[0][2]?.getPurple()?.setPiece(type: 2, white: true)
        cubes[0][3]?.getOrange()?.setPiece(type: 1, white: true)
        cubes[1][0]?.getPurple()?.setPiece(type: 6, white: true)
        cubes[1][1]?.getOrange()?.setPiece(type: 6, white: true)
        cubes[1][1]?.getPurple()?.setPiece(type: 6, white: true)
        cubes[1][2]?.getOrange()?.setPiece(type: 6, white: true)
        cubes[1][2]?.getPurple()?.setPiece(type: 6, white: true)
        cubes[1][3]?.getOrange()?.setPiece(type: 6, white: true)
        cubes[1][3]?.getPurple()?.setPiece(type: 6, white: true)
        cubes[1][4]?.getOrange()?.setPiece(type: 6, white: true)
        
        cubes[5][3]?.getOrange()?.setPiece(type: 1, white: false)
        cubes[5][3]?.getPurple()?.setPiece(type: 2, white: false)
        cubes[5][4]?.getOrange()?.setPiece(type: 3, white: false)
        cubes[5][4]?.getPurple()?.setPiece(type: 4, white: false)
        cubes[5][5]?.getOrange()?.setPiece(type: 2, white: false)
        cubes[5][5]?.getPurple()?.setPiece(type: 1, white: false)
        cubes[4][3]?.getYellow()?.setPiece(type: 5, white: false)
        cubes[4][4]?.getYellow()?.setPiece(type: 5, white: false)
        cubes[4][2]?.getOrange()?.setPiece(type: 6, white: false)
        cubes[4][2]?.getPurple()?.setPiece(type: 6, white: false)
        cubes[4][3]?.getOrange()?.setPiece(type: 6, white: false)
        cubes[4][3]?.getPurple()?.setPiece(type: 6, white: false)
        cubes[4][4]?.getOrange()?.setPiece(type: 6, white: false)
        cubes[4][4]?.getPurple()?.setPiece(type: 6, white: false)
        cubes[4][5]?.getOrange()?.setPiece(type: 6, white: false)
        cubes[4][5]?.getPurple()?.setPiece(type: 6, white: false)
    }
    
    func flipPieces() {
        for row in cubes {
            for cube in row {
                if (cube != nil) {
                    for rhombus in cube!.rhombuses {
                        if (!rhombus.isOpen()) {
                            rhombus.piece?.setImage(image: (rhombus.piece?.getImage().image?.rotate(radians: .pi))!)
                        }
                    }
                }
            }
        }
    }
}

extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
