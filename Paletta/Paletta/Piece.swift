//
//  Piece.swift
//  Paletta
//
//  Created by Z. Gamal on 5/19/21.
//  Copyright © 2021 Z. Gamal. All rights reserved.
//

import Foundation
import UIKit

class Piece {
    
    var rhombus: Rhombus
    var type: Int
    var white: Bool
    var image: UIImageView

    init(rhombus: Rhombus, type: Int, white: Bool) {
        self.rhombus = rhombus
        self.type = type
        self.white = white
        let imageView = UIImageView(image: UIImage(named: "\(white)\(type)")!)
        imageView.frame = CGRect(x: rhombus.x, y: rhombus.y, width: 20, height: 25)
        self.image = imageView
        imageView.piece = self
    }
    
    func setImage(image: UIImage) {
        self.image.image = image
    }
    
    func getRhombus() -> Rhombus {
        return self.rhombus
    }
    
    func setRhombus(rhombus: Rhombus) {
        self.rhombus = rhombus
    }
    
    func getType() -> Int {
        return self.type
    }
    
    func isWhite() -> Bool {
        return white
    }
    
    func getImage() -> UIImageView {
        return self.image
    }
    
    func updateType(newType: Int, white: Bool, newImage: UIImageView) {
        self.type = newType
        self.white = white
        self.image = newImage
    }
    
    
    func findMoves() -> [Rhombus] {
        let game = self.rhombus.getCube().getGame()
        let r = self.rhombus.getCube().getR()
        let c = self.rhombus.getCube().getC()
        let color = self.rhombus.getType()
        var result: [Rhombus] = []
        
        switch type {
            case 1:
                for rhombus in getPossibleEMoves() {
                    result.append(rhombus)
                }
                break
            
            case 2:
                for rhombus in getPossibleKMoves() {
                    result.append(rhombus)
                }
                break
            
            case 3:
                for rhombus in getPossibleEMoves() {
                    result.append(rhombus)
                }
                for rhombus in getPossiblePMoves() {
                    result.append(rhombus)
                }
                break

            case 4:
                for rhombus in getPossibleEMoves1Step() {
                    result.append(rhombus)
                }
                for rhombus in getPossiblePMoves1Step() {
                    result.append(rhombus)
                }
                break
            
            case 5:
                for rhombus in getPossiblePMoves() {
                    result.append(rhombus)
                }
                for rhombus in getPossibleEMoves1Step() {
                    result.append(rhombus)
                }
                break
            
            case 6:
                if ((r == 1 && white && (rhombus.getType() == 1 || rhombus.getType() == 3)) || (r == 4 && !white && (rhombus.getType() == 1 || rhombus.getType() == 3))) {
                    for rhombus in getPossibleEMovesPawn2Step() {
                        result.append(rhombus)
                    }
                } else {
                    for rhombus in getPossibleEMovesPawn() {
                        result.append(rhombus)
                    }
                }
                break
            
            default:
                break
            }
        
        return result
    }

    func getPossibleEMoves() -> [Rhombus] {
            let game = self.rhombus.getCube().getGame()
            let r = self.rhombus.getCube().getR()
            let c = self.rhombus.getCube().getC()
            let color = self.rhombus.getType()
            var result: [Rhombus] = []

    //       var ingame.getCubes().index(of rhomus.cube: Cube)
    //
    //        switch type {
    //        //rook
    //            case 1:
    //                //when on a purple rhombus
                    if(color == 1) {
                        if (c != 5) {
                        for i in c+1...5 {
                            if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getOrange() != nil) {
                                if ((game.getCubes()[r][i]?.getOrange()!.isOpen())!) {
                                    result.append((game.getCubes()[r][i]?.getOrange())!)
                                }
                                else if ((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[r][i]?.getOrange())!)
                                    break
                                }
                                else if ((((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                            if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getPurple() != nil) {
                                if ((game.getCubes()[r][i]?.getPurple()!.isOpen())!) {
                                    result.append((game.getCubes()[r][i]?.getPurple())!)
                                }
                                else if ((game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[r][i]?.getPurple())!)
                                    break
                                }
                                else if ((((game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                        }
                        }
                    
                        if (c != 0) {
                            for i in (0...c-1).reversed() {
                                if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getPurple() != nil) {
                                    if ((game.getCubes()[r][i]?.getPurple()!.isOpen())!) {
                                        result.append((game.getCubes()[r][i]?.getPurple())!)
                                    }
                                    else if ((game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r][i]?.getPurple())!)
                                        break
                                    }
                                    else if (game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite() {
                                        break
                                    }
                                }
                                if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getOrange() != nil) {
                                    if ((game.getCubes()[r][i]?.getOrange()!.isOpen())!) {
                                        result.append((game.getCubes()[r][i]?.getOrange())!)
                                    }
                                    else if ((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r][i]?.getOrange())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                            }
                        }
                        
                        if (r != 5) {
                        for i in r+1...5 {
                            if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getPurple() != nil) {
                                if ((game.getCubes()[i][c]?.getPurple()!.isOpen())!) {
                                    result.append((game.getCubes()[i][c]?.getPurple())!)
                                }
                                else if ((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[i][c]?.getPurple())!)
                                    break
                                }
                                else if ((((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                            if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getYellow() != nil) {
                                if ((game.getCubes()[i][c]?.getYellow()!.isOpen())!) {
                                    result.append((game.getCubes()[i][c]?.getYellow())!)
                                }
                                else if ((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[i][c]?.getYellow())!)
                                    break
                                }
                                else if ((((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                        }
                        }
                        
                        if (r != 0) {
                            for i in (0...r-1).reversed() {
                                if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getYellow() != nil) {
                                    if ((game.getCubes()[i][c]?.getYellow()!.isOpen())!) {
                                        result.append((game.getCubes()[i][c]?.getYellow())!)
                                    }
                                    else if ((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[i][c]?.getYellow())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                                if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getPurple() != nil) {
                                    if ((game.getCubes()[i][c]?.getPurple()!.isOpen())!) {
                                        result.append((game.getCubes()[i][c]?.getPurple())!)
                                    }
                                    else if ((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[i][c]?.getPurple())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                            }
                        }
                        if (game.getCubes()[r][c] != nil && game.getCubes()[r][c]?.getYellow() != nil && (game.getCubes()[r][c]?.getYellow()!.isOpen() == true || (game.getCubes()[r][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
                         result.append((game.getCubes()[r][c]?.getYellow())!)
                        }
                        if (game.getCubes()[r][c] != nil && game.getCubes()[r][c]?.getOrange() != nil && (game.getCubes()[r][c]?.getOrange()!.isOpen() == true || (game.getCubes()[r][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
                            result.append((game.getCubes()[r][c]?.getOrange())!)
                        }
                    }
                    
                    
                    
                    
                    
                    
                    //when on a yellow rhombus
                    if(color == 2) {
                        if (c != 5) {
                        for i in c+1...5 {
                            if (r+i-c >= 5) { break }
                            if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]?.getOrange() != nil) {
                                if ((game.getCubes()[r+i-c][i]?.getOrange()!.isOpen())!) {
                                    result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                }
                                else if ((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                    break
                                }
                                else if ((((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                            if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]!.getYellow() != nil) {
                                if ((game.getCubes()[r+i-c][i]?.getYellow()!.isOpen())!) {
                                    result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                }
                                else if ((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                    break
                                }
                                else if ((((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                        }
                        }
                        
                        
                        if(c != 0) {
                            for i in (0...c-1).reversed() {
                                if (r+i-c <= 0) { break }
                                if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]?.getYellow() != nil) {
                                    if ((game.getCubes()[r+i-c][i]?.getYellow()!.isOpen())!) {
                                        result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                    }
                                    else if ((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                                if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]?.getOrange() != nil) {
                                    if ((game.getCubes()[r+i-c][i]?.getOrange()!.isOpen())!) {
                                        result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                    }
                                    else if ((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                            }
                        }
                        
                        if (r != 5) {
                        for i in r+1...5 {
                            if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getPurple() != nil) {
                                if ((game.getCubes()[i][c]?.getPurple()!.isOpen())!) {
                                    result.append((game.getCubes()[i][c]?.getPurple())!)
                                }
                                else if ((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[i][c]?.getPurple())!)
                                    break
                                }
                                else if ((((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                            if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getYellow() != nil) {
                                if ((game.getCubes()[i][c]?.getYellow()!.isOpen())!) {
                                    result.append((game.getCubes()[i][c]?.getYellow())!)
                                }
                                else if ((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[i][c]?.getYellow())!)
                                    break
                                }
                                else if ((((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                        }
                        }
                        
                        if (r != 0) {
                            for i in (0...r-1).reversed() {
                                if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getYellow() != nil) {
                                    if ((game.getCubes()[i][c]?.getYellow()!.isOpen())!) {
                                        result.append((game.getCubes()[i][c]?.getYellow())!)
                                    }
                                    else if ((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[i][c]?.getYellow())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[i][c]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                                if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getPurple() != nil) {
                                    if ((game.getCubes()[i][c]?.getPurple()!.isOpen())!) {
                                        result.append((game.getCubes()[i][c]?.getPurple())!)
                                    }
                                    else if ((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[i][c]?.getPurple())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[i][c]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                            }
                            
                            if (game.getCubes()[r][c] != nil && game.getCubes()[r][c]?.getPurple() != nil && (game.getCubes()[r][c]?.getPurple()!.isOpen() == true || (game.getCubes()[r][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
                                result.append((game.getCubes()[r][c]?.getPurple())!)
                            }
                            if (game.getCubes()[r][c] != nil && game.getCubes()[r][c]?.getOrange() != nil && (game.getCubes()[r][c]?.getOrange()!.isOpen() == true || (game.getCubes()[r][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
                                result.append((game.getCubes()[r][c]?.getOrange())!)
                            }
            
                        }
                    }
                    
                    
                    
                    
                    //when on a orange rhombus
                    if(color == 3) {
                        
                        if (c != 5) {
                        for i in c+1...5 {
                            if (r+i-c >= 5) { break }
                            if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]?.getOrange() != nil) {
                                if ((game.getCubes()[r+i-c][i]?.getOrange()!.isOpen())!) {
                                    result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                }
                                else if ((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                    break
                                }
                                else if ((((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                            if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]?.getYellow() != nil) {
                                if ((game.getCubes()[r+i-c][i]?.getYellow()!.isOpen())!) {
                                    result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                }
                                else if ((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                    result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                    break
                                }
                                else if ((((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                    break
                                }
                            }
                            
                        }
                        }
                        
                        if (c != 0) {
                            for i in (0...c-1).reversed() {
                                if (r+i-c <= 0) { break }
                                if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]?.getYellow() != nil && c>0) {
                                    if ((game.getCubes()[r+i-c][i]?.getYellow()!.isOpen())!) {
                                        result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                    }
                                    else if ((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r+i-c][i]?.getYellow())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r+i-c][i]?.getYellow()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                                if (game.getCubes()[r+i-c][i] != nil && game.getCubes()[r+i-c][i]?.getOrange() != nil) {
                                    if ((game.getCubes()[r+i-c][i]?.getOrange()!.isOpen())!) {
                                        result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                    }
                                    else if ((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r+i-c][i]?.getOrange())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r+i-c][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                                
                            }
                            
                            if (c != 5) {
                            for i in c+1...5 {
                                if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getOrange() != nil) {
                                    if ((game.getCubes()[r][i]?.getOrange()!.isOpen())!) {
                                        result.append((game.getCubes()[r][i]?.getOrange())!)
                                    }
                                    else if ((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r][i]?.getOrange())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                                if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getPurple() != nil) {
                                    if ((game.getCubes()[r][i]?.getPurple()!.isOpen())!) {
                                        result.append((game.getCubes()[r][i]?.getPurple())!)
                                    }
                                    else if ((game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r][i]?.getPurple())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                            }
                        }
                        }
                    
                        if (c != 0) {
                            for i in (0...c-1).reversed() {
                                if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getPurple() != nil) {
                                    if ((game.getCubes()[r][i]?.getPurple()!.isOpen())!) {
                                        result.append((game.getCubes()[r][i]?.getPurple())!)
                                    }
                                    else if ((game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r][i]?.getPurple())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r][i]?.getPurple()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                                if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getOrange() != nil) {
                                    if ((game.getCubes()[r][i]?.getOrange()!.isOpen())!) {
                                        result.append((game.getCubes()[r][i]?.getOrange())!)
                                    }
                                    else if ((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite()) {
                                        result.append((game.getCubes()[r][i]?.getOrange())!)
                                        break
                                    }
                                    else if ((((game.getCubes()[r][i]?.getOrange()!.getPiece()?.isWhite())! == self.isWhite()))) {
                                        break
                                    }
                                }
                            }
                        }
                        
                        if (game.getCubes()[r][c] != nil && game.getCubes()[r][c]?.getPurple() != nil && (game.getCubes()[r][c]?.getPurple()!.isOpen() == true || (game.getCubes()[r][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
                            result.append((game.getCubes()[r][c]?.getPurple())!)
                        }
                        if (game.getCubes()[r][c] != nil && game.getCubes()[r][c]?.getYellow() != nil && (game.getCubes()[r][c]?.getYellow()!.isOpen() == true || (game.getCubes()[r][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
                            result.append((game.getCubes()[r][c]?.getYellow())!)
                        }

                    }
            
    //        if (type == 2) {
    //            if (color == 1) {
    //                if (game.getCubes()[r-1][c+1]?.getYellow() != nil && ((game.getCubes()[r-1][c+1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c+1]?.getYellow())!)
    //                }
    //                if (game.getCubes()[r-1][c+1]?.getOrange() != nil && ((game.getCubes()[r-1][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c+1]?.getOrange())!)
    //                }
    //                if (game.getCubes()[r+1][c]?.getOrange() != nil && ((game.getCubes()[r+1][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+1][c]?.getOrange())!)
    //                }
    //                if (game.getCubes()[r][c-1]?.getYellow() != nil && ((game.getCubes()[r][c-1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c-1]?.getYellow())!)
    //                }
    //                if (game.getCubes()[r][c+1]?.getYellow() != nil && ((game.getCubes()[r][c+1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c+1]?.getYellow())!)
    //                }
    //                if (game.getCubes()[r-1][c-1]?.getYellow() != nil && ((game.getCubes()[r-1][c-1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c-1]?.getYellow())!)
    //                }
    //                if (game.getCubes()[r+1][c+1]?.getOrange() != nil && ((game.getCubes()[r+1][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+1][c+1]?.getOrange())!)
    //                }
    //                if (game.getCubes()[r-1][c]?.getOrange() != nil && ((game.getCubes()[r-1][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c]?.getOrange())!)
    //                }
    //
    //            }
    //            if (color == 2) {
    //                if (game.getCubes()[r][c-1]?.getOrange() != nil && ((game.getCubes()[r][c-1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c-1]?.getOrange())!)
    //                }
    //                if (game.getCubes()[r-1][c-1]?.getPurple() != nil && ((game.getCubes()[r-1][c-1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c-1]?.getPurple())!)
    //                }
    //                if (game.getCubes()[r+2][c+1]?.getOrange() != nil && ((game.getCubes()[r+2][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+2][c+1]?.getOrange())!)
    //                }
    //                if (game.getCubes()[r+2][c+1]?.getPurple() != nil && ((game.getCubes()[r+2][c+1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+2][c+1]?.getPurple())!)
    //                }
    //                if (game.getCubes()[r][c+1]?.getOrange() != nil && ((game.getCubes()[r][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c+1]?.getOrange())!)
    //                }
    //                if (game.getCubes()[r+1][c]?.getOrange() != nil && ((game.getCubes()[r+1][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+1][c]?.getOrange())!)
    //                }
    //                if (game.getCubes()[r+1][c+1]?.getPurple() != nil && ((game.getCubes()[r+1][c+1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+1][c+1]?.getPurple())!)
    //                }
    //                if (game.getCubes()[r][c-1]?.getPurple() != nil && ((game.getCubes()[r][c-1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c-1]?.getPurple())!)
    //                }
    //
    //            }
    //            if (color == 3) {
    //                if (game.getCubes()[r][c+1]?.getYellow() != nil && ((game.getCubes()[r][c+1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c+1]?.getYellow())!)
    //                }
    //                if (game.getCubes()[r+1][c+1]?.getPurple() != nil && ((game.getCubes()[r+1][c+1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+1][c+1]?.getPurple())!)
    //                }
    //                if (game.getCubes()[r-1][c-2]?.getPurple() != nil && ((game.getCubes()[r-1][c-2]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c-2]?.getPurple())!)
    //                }
    //                if (game.getCubes()[r-1][c-2]?.getYellow() != nil && ((game.getCubes()[r-1][c-2]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c-2]?.getYellow())!)
    //                }
    //                if (game.getCubes()[r-1][c-1]?.getPurple() != nil && ((game.getCubes()[r-1][c-1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c-1]?.getPurple())!)
    //                }
    //                if (game.getCubes()[r+1][c]?.getPurple() != nil && ((game.getCubes()[r+1][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r+1][c]?.getPurple())!)
    //                }
    //                if (game.getCubes()[r][c-1]?.getYellow() != nil && ((game.getCubes()[r][c-1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r][c-1]?.getYellow())!)
    //                }
    //                if (game.getCubes()[r-1][c]?.getYellow() != nil && ((game.getCubes()[r-1][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
    //                    result.append((game.getCubes()[r-1][c]?.getYellow())!)
    //                }
    //            }
        //    }
            return result
        }
    
    func getPossiblePMoves() -> [Rhombus] {
        let game = self.rhombus.getCube().getGame()
        let r = self.rhombus.getCube().getR()
        let c = self.rhombus.getCube().getC()
        let color = self.rhombus.getType()
        var result: [Rhombus] = []
        
        switch color {
            case 1:
                if (r < 5) {
                for i in r+1...5 {
                    let ic = c + (i-r)
                    if (game.getCubes()[i][ic] != nil && game.getCubes()[i][ic]?.getType() != 2) {
                        if (!(game.getCubes()[i][ic]?.getPurple()?.isOpen())!) {
                            if game.getCubes()[i][ic]?.getPurple()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[i][ic]?.getPurple())!)
                            }
                            break
                        } else {
                            result.append((game.getCubes()[i][ic]?.getPurple())!)
                        }
                    }
                }
                }
                if (r > 0) {
                for i in (0...r-1).reversed() {
                    let ic = c + (i-r)
                    if (game.getCubes()[i][ic] != nil && game.getCubes()[i][ic]?.getType() != 2) {
                        if (!(game.getCubes()[i][ic]?.getPurple()?.isOpen())!) {
                            if game.getCubes()[i][ic]?.getPurple()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[i][ic]?.getPurple())!)
                            }
                            break
                        } else {
                            result.append((game.getCubes()[i][ic]?.getPurple())!)
                        }
                    }
                }
                }
                break
            
            case 2:
                if c < 5 {
                for i in c+1...5 {
                    if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getType() != 3) {
                        if (!(game.getCubes()[r][i]?.getYellow()?.isOpen())!) {
                            if game.getCubes()[r][i]?.getYellow()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r][i]?.getYellow())!)
                            }
                            break
                        } else {
                            result.append((game.getCubes()[r][i]?.getYellow())!)
                        }
                    }
                }
                }
                if c > 0 {
                for i in (0...c-1).reversed() {
                    if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getType() != 3) {
                        if (!(game.getCubes()[r][i]?.getYellow()?.isOpen())!) {
                            if game.getCubes()[r][i]?.getYellow()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r][i]?.getYellow())!)
                            }
                            break
                        } else {
                            result.append((game.getCubes()[r][i]?.getYellow())!)
                        }
                    }
                }
                }
                break
            
            case 3:
                if r < 5 {
                for i in r+1...5 {
                    if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getType() != 1) {
                        if (!(game.getCubes()[i][c]?.getOrange()?.isOpen())!) {
                            if game.getCubes()[i][c]?.getOrange()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[i][c]?.getOrange())!)
                            }
                            break
                        } else {
                            result.append((game.getCubes()[i][c]?.getOrange())!)
                        }
                    }
                }
                }
                if r > 0 {
                for i in (0...r-1).reversed() {
                    if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getType() != 1) {
                        if (!(game.getCubes()[i][c]?.getOrange()?.isOpen())!) {
                            if game.getCubes()[i][c]?.getOrange()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[i][c]?.getOrange())!)
                            }
                            break
                        } else {
                            result.append((game.getCubes()[i][c]?.getOrange())!)
                        }
                    }
                }
                }
                break

            
            default:
                break
            }
        
        return result
    }
    
    func getPossiblePMoves1Step() -> [Rhombus] {
        let game = self.rhombus.getCube().getGame()
        let r = self.rhombus.getCube().getR()
        let c = self.rhombus.getCube().getC()
        let color = self.rhombus.getType()
        var result: [Rhombus] = []
        
        switch color {
            case 1:
                if (r+1 < 6 && c+1 < 6) {
                    if (game.getCubes()[r+1][c+1] != nil && game.getCubes()[r+1][c+1]?.getType() != 2) {
                        if (!(game.getCubes()[r+1][c+1]?.getPurple()?.isOpen())!) {
                            if game.getCubes()[r+1][c+1]?.getPurple()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r+1][c+1]?.getPurple())!)
                            }
                        } else {
                            result.append((game.getCubes()[r+1][c+1]?.getPurple())!)
                        }
                    }
                }
                if (r-1 >= 0 && c-1 >= 0) {
                    if (game.getCubes()[r-1][c-1] != nil && game.getCubes()[r-1][c-1]?.getType() != 2) {
                        if (!(game.getCubes()[r-1][c-1]?.getPurple()?.isOpen())!) {
                            if game.getCubes()[r-1][c-1]?.getPurple()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r-1][c-1]?.getPurple())!)
                            }
                        } else {
                            result.append((game.getCubes()[r-1][c-1]?.getPurple())!)
                        }
                    }
                }
                break
            
            case 2:
                if (c+1 < 6) {
                    if (game.getCubes()[r][c+1] != nil && game.getCubes()[r][c+1]?.getType() != 3) {
                        if (!(game.getCubes()[r][c+1]?.getYellow()?.isOpen())!) {
                            if game.getCubes()[r][c+1]?.getYellow()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r][c+1]?.getYellow())!)
                            }
                        } else {
                            result.append((game.getCubes()[r][c+1]?.getYellow())!)
                        }
                    }
                }
                if (c-1 >= 0) {
                    if (game.getCubes()[r][c-1] != nil && game.getCubes()[r][c-1]?.getType() != 3) {
                        if (!(game.getCubes()[r][c-1]?.getYellow()?.isOpen())!) {
                            if game.getCubes()[r][c-1]?.getYellow()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r][c-1]?.getYellow())!)
                            }
                        } else {
                            result.append((game.getCubes()[r][c-1]?.getYellow())!)
                        }
                    }
                }
                break
            
            case 3:
                if (r+1 < 6) {
                    if (game.getCubes()[r+1][c] != nil && game.getCubes()[r+1][c]?.getType() != 1) {
                        if (!(game.getCubes()[r+1][c]?.getOrange()?.isOpen())!) {
                            if game.getCubes()[r+1][c]?.getOrange()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r+1][c]?.getOrange())!)
                            }
                        } else {
                            result.append((game.getCubes()[r+1][c]?.getOrange())!)
                        }
                    }
                }
                if (r-1 >= 0) {
                    if (game.getCubes()[r-1][c] != nil && game.getCubes()[r-1][c]?.getType() != 1) {
                        if (!(game.getCubes()[r-1][c]?.getOrange()?.isOpen())!) {
                            if game.getCubes()[r-1][c]?.getOrange()?.getPiece()?.isWhite() != self.white {
                                result.append((game.getCubes()[r-1][c]?.getOrange())!)
                            }
                        } else {
                            result.append((game.getCubes()[r-1][c]?.getOrange())!)
                        }
                    }
                }
                break

            default:
                break
            }
        
        return result
    }
    
    
    func getPossiblePMoves2Step() -> [Rhombus] {
        let game = self.rhombus.getCube().getGame()
        let r = self.rhombus.getCube().getR()
        let c = self.rhombus.getCube().getC()
        let color = self.rhombus.getType()
        var result: [Rhombus] = []
        
        switch color {
            case 1:
                for i in r+1...r+2 {
                    let ic = c + (i-r)
                    if (i < 6 && ic < 6) {
                        if (game.getCubes()[i][ic] != nil && game.getCubes()[i][ic]?.getType() != 2) {
                            if (!(game.getCubes()[i][ic]?.getPurple()?.isOpen())!) {
                                if game.getCubes()[i][ic]?.getPurple()?.getPiece()?.isWhite() != self.white {
                                    result.append((game.getCubes()[i][ic]?.getPurple())!)
                                }
                                break
                            } else {
                                result.append((game.getCubes()[i][ic]?.getPurple())!)
                            }
                        }
                    }
                }
                for i in (r-2...r-1).reversed() {
                    let ic = c + (i-r)
                    if (i >= 0 && ic >= 0) {
                        if (game.getCubes()[i][ic] != nil && game.getCubes()[i][ic]?.getType() != 2) {
                            if (!(game.getCubes()[i][ic]?.getPurple()?.isOpen())!) {
                                if game.getCubes()[i][ic]?.getPurple()?.getPiece()?.isWhite() != self.white {
                                    result.append((game.getCubes()[i][ic]?.getPurple())!)
                                }
                                break
                            } else {
                                result.append((game.getCubes()[i][ic]?.getPurple())!)
                            }
                        }
                    }
                }
                break
            
            case 2:
                for i in c+1...c+2 {
                    if (i < 6) {
                        if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getType() != 3) {
                            if (!(game.getCubes()[r][i]?.getYellow()?.isOpen())!) {
                                if game.getCubes()[r][i]?.getYellow()?.getPiece()?.isWhite() != self.white {
                                    result.append((game.getCubes()[r][i]?.getYellow())!)
                                }
                                break
                            } else {
                                result.append((game.getCubes()[r][i]?.getYellow())!)
                            }
                        }
                    }
                }
                for i in (c-2...c-1).reversed() {
                    if (i >= 0) {
                        if (game.getCubes()[r][i] != nil && game.getCubes()[r][i]?.getType() != 3) {
                            if (!(game.getCubes()[r][i]?.getYellow()?.isOpen())!) {
                                if game.getCubes()[r][i]?.getYellow()?.getPiece()?.isWhite() != self.white {
                                    result.append((game.getCubes()[r][i]?.getYellow())!)
                                }
                                break
                            } else {
                                result.append((game.getCubes()[r][i]?.getYellow())!)
                            }
                        }
                    }
                }
                break
            
            case 3:
                for i in r+1...r+2 {
                    if (i < 6) {
                        if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getType() != 1) {
                            if (!(game.getCubes()[i][c]?.getOrange()?.isOpen())!) {
                                if game.getCubes()[i][c]?.getOrange()?.getPiece()?.isWhite() != self.white {
                                    result.append((game.getCubes()[i][c]?.getOrange())!)
                                }
                                break
                            } else {
                                result.append((game.getCubes()[i][c]?.getOrange())!)
                            }
                        }
                    }
                }
                for i in (r-2...r-1).reversed() {
                    if (i >= 0) {
                        if (game.getCubes()[i][c] != nil && game.getCubes()[i][c]?.getType() != 1) {
                            if (!(game.getCubes()[i][c]?.getOrange()?.isOpen())!) {
                                if game.getCubes()[i][c]?.getOrange()?.getPiece()?.isWhite() != self.white {
                                    result.append((game.getCubes()[i][c]?.getOrange())!)
                                }
                                break
                            } else {
                                result.append((game.getCubes()[i][c]?.getOrange())!)
                            }
                        }
                    }
                }
                break

            default:
                break
            }
        
        return result
    }
    
//    func getPossiblePawnMoves() -> [Rhombus] {
//        let game = self.rhombus.getCube().getGame()
//        let r = self.rhombus.getCube().getR()
//        let c = self.rhombus.getCube().getC()
//        let color = self.rhombus.getType()
//        var result: [Rhombus] = []
//
//        switch <#value#> {
//        case <#pattern#>:
//            <#code#>
//        default:
//
//        }
//
//        return result
//    }

    
    func getPossibleKMoves() -> [Rhombus] {
      let game = self.rhombus.getCube().getGame()
      let r = self.rhombus.getCube().getR()
      let c = self.rhombus.getCube().getC()
      let color = self.rhombus.getType()
      var result: [Rhombus] = []
      if (type == 2) {
       if (color == 1) {
          if (r-1 >= 0 && c+1 <= 5 && game.getCubes()[r-1][c+1] != nil && game.getCubes()[r-1][c+1]?.getYellow() != nil && ((game.getCubes()[r-1][c+1]?.getYellow()!.isOpen() == true || (game.getCubes()[r-1][c+1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite()))) {
         result.append((game.getCubes()[r-1][c+1]?.getYellow())!)
        }
          if (r-1 >= 0 && c+1 <= 5 && game.getCubes()[r-1][c+1] != nil && game.getCubes()[r-1][c+1]?.getOrange() != nil && (game.getCubes()[r-1][c+1]?.getOrange()!.isOpen() == true || (game.getCubes()[r-1][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c+1]?.getOrange())!)
        }
          if (r+1 <= 5 && game.getCubes()[r+1][c] != nil && game.getCubes()[r+1][c]?.getOrange() != nil && (game.getCubes()[r+1][c]?.getOrange()!.isOpen() == true || (game.getCubes()[r+1][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+1][c]?.getOrange())!)
        }
          if (c-1 >= 0 && game.getCubes()[r][c-1] != nil && game.getCubes()[r][c-1]?.getYellow() != nil && (game.getCubes()[r][c-1]?.getYellow()!.isOpen() == true || (game.getCubes()[r][c-1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r][c-1]?.getYellow())!)
        }
          if (c+1 <= 5 && game.getCubes()[r][c+1] != nil && game.getCubes()[r][c+1]?.getYellow() != nil && (  game.getCubes()[r][c+1]?.getYellow()!.isOpen() == true || (game.getCubes()[r][c+1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r][c+1]?.getYellow())!)
        }
        if (r-1 >= 0 && c-1 >= 0 && game.getCubes()[r-1][c-1] != nil && game.getCubes()[r-1][c-1]?.getYellow() != nil && (game.getCubes()[r-1][c-1]?.getYellow()!.isOpen() == true || (game.getCubes()[r-1][c-1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c-1]?.getYellow())!)
        }
        if (r+1 <= 5 && c+1 <= 5 && game.getCubes()[r+1][c+1] != nil && game.getCubes()[r+1][c+1]?.getOrange() != nil && (game.getCubes()[r+1][c+1]?.getOrange()!.isOpen() == true || (game.getCubes()[r+1][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+1][c+1]?.getOrange())!)
        }
        if (r-1 >= 0 && game.getCubes()[r-1][c] != nil && game.getCubes()[r-1][c]?.getOrange() != nil && (game.getCubes()[r-1][c]?.getOrange()!.isOpen() == true || (game.getCubes()[r-1][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c]?.getOrange())!)
        }
       }
       if (color == 2) {
        if (c-1 >= 0 && game.getCubes()[r][c-1] != nil && game.getCubes()[r][c-1]?.getOrange() != nil && (game.getCubes()[r][c-1]?.getOrange()!.isOpen() == true || (game.getCubes()[r][c-1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r][c-1]?.getOrange())!)
        }
        if (c-1 >= 0 && r-1 >= 0 && game.getCubes()[r-1][c-1] != nil && game.getCubes()[r-1][c-1]?.getPurple() != nil && (game.getCubes()[r-1][c-1]?.getPurple()!.isOpen() == true || (game.getCubes()[r-1][c-1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c-1]?.getPurple())!)
        }
        if (c+1 <= 5 && r+2 <= 5 && game.getCubes()[r+2][c+1] != nil && game.getCubes()[r+2][c+1]?.getOrange() != nil && (game.getCubes()[r+2][c+1]?.getOrange()!.isOpen() == true || (game.getCubes()[r+2][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+2][c+1]?.getOrange())!)
        }
        if (c+1 <= 5 && r+2 <= 5 && game.getCubes()[r+2][c+1] != nil && game.getCubes()[r+2][c+1]?.getPurple() != nil && (game.getCubes()[r+2][c+1]?.getPurple()!.isOpen() == true || (game.getCubes()[r+2][c+1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+2][c+1]?.getPurple())!)
        }
        if (c+1 <= 5 && game.getCubes()[r][c+1] != nil && game.getCubes()[r][c+1]?.getOrange() != nil && (game.getCubes()[r][c+1]?.getOrange()!.isOpen() == true || (game.getCubes()[r][c+1]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r][c+1]?.getOrange())!)
        }
        if (r+1 <= 5 && game.getCubes()[r+1][c] != nil && game.getCubes()[r+1][c]?.getOrange() != nil && (game.getCubes()[r+1][c]?.getOrange()!.isOpen() == true || (game.getCubes()[r+1][c]?.getOrange()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+1][c]?.getOrange())!)
        }
        if (r+1 <= 5 && c+1 <= 5 && game.getCubes()[r+1][c+1] != nil && game.getCubes()[r+1][c+1]?.getPurple() != nil && (game.getCubes()[r+1][c+1]?.getPurple()!.isOpen() == true || (game.getCubes()[r+1][c+1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+1][c+1]?.getPurple())!)
        }
        if (c-1 >= 0 && game.getCubes()[r][c-1] != nil && game.getCubes()[r][c-1]?.getPurple() != nil && (game.getCubes()[r][c-1]?.getPurple()!.isOpen() == true || (game.getCubes()[r][c-1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r][c-1]?.getPurple())!)
        }
       }
       if (color == 3) {
        if (c+1 <= 5 && game.getCubes()[r][c+1] != nil && game.getCubes()[r][c+1]?.getYellow() != nil && (game.getCubes()[r][c+1]?.getYellow()!.isOpen() == true || (game.getCubes()[r][c+1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r][c+1]?.getYellow())!)
        }
        if (r+1 <= 5 && c+1 <= 5 && game.getCubes()[r+1][c+1] != nil && game.getCubes()[r+1][c+1]?.getPurple() != nil && (game.getCubes()[r+1][c+1]?.getPurple()!.isOpen() == true || (game.getCubes()[r+1][c+1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+1][c+1]?.getPurple())!)
        }
        if (r-1 >= 0 && c-2 >= 0 && game.getCubes()[r-1][c-2] != nil && game.getCubes()[r-1][c-2]?.getPurple() != nil && (game.getCubes()[r-1][c-2]?.getPurple()!.isOpen() == true || (game.getCubes()[r-1][c-2]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c-2]?.getPurple())!)
        }
        if (r-1 >= 0 && c-2 >= 0 && game.getCubes()[r-1][c-2] != nil && game.getCubes()[r-1][c-2]?.getYellow() != nil && (game.getCubes()[r-1][c-2]?.getYellow()!.isOpen() == true || (game.getCubes()[r-1][c-2]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c-2]?.getYellow())!)
        }
        if (c-1 >= 0 && r-1 >= 0 && game.getCubes()[r-1][c-1] != nil && game.getCubes()[r-1][c-1]?.getPurple() != nil && (game.getCubes()[r-1][c-1]?.getPurple()!.isOpen() == true || (game.getCubes()[r-1][c-1]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c-1]?.getPurple())!)
        }
        if (r+1 <= 5 && game.getCubes()[r+1][c] != nil && game.getCubes()[r+1][c]?.getPurple() != nil && (game.getCubes()[r+1][c]?.getPurple()!.isOpen() == true || (game.getCubes()[r+1][c]?.getPurple()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r+1][c]?.getPurple())!)
        }
        if (c-1 >= 0 && game.getCubes()[r][c-1] != nil && game.getCubes()[r][c-1]?.getYellow() != nil && (game.getCubes()[r][c-1]?.getYellow()!.isOpen() == true || (game.getCubes()[r][c-1]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r][c-1]?.getYellow())!)
        }
        if (r-1 >= 0 && game.getCubes()[r-1][c] != nil && game.getCubes()[r-1][c]?.getYellow() != nil && (game.getCubes()[r-1][c]?.getYellow()!.isOpen() == true || (game.getCubes()[r-1][c]?.getYellow()!.getPiece()?.isWhite())! != self.isWhite())) {
         result.append((game.getCubes()[r-1][c]?.getYellow())!)
        }
       }
      }
      return result
    }
    
    func getPossibleEMoves1Step() -> [Rhombus] {
        let game = self.rhombus.getCube().getGame()
        let r = self.rhombus.getCube().getR()
        let c = self.rhombus.getCube().getC()
        let cube = self.rhombus.getCube()
        var result: [Rhombus] = []
        let ctype = self.rhombus.getCube().getType() // w orange = 1, w purple = 2, w yellow = 3, all = 4
        
        switch self.rhombus.getType() {
            case 1:
                if ctype != 3 {
                    if (cube.getYellow()!.getPiece()?.isWhite() != white) {
                        result.append(cube.getYellow()!)
                    }
                }
                if ctype != 1 {
                    if (cube.getOrange()!.getPiece()?.isWhite() != white) {
                        result.append(cube.getOrange()!)
                    }
                }
                if (r > 0) {
                    if (game.getCubes()[r-1][c]?.getYellow())!.getPiece()?.isWhite() != white {
                        result.append((game.getCubes()[r-1][c]?.getYellow())!)
                    }
                }
                if (c < 5) {
                    if (game.getCubes()[r][c+1]?.getOrange())!.getPiece()?.isWhite() != white {
                        result.append((game.getCubes()[r][c+1]?.getOrange())!)
                    }
                }
            break
                
            case 2:
                if ctype != 1 {
                    if (cube.getOrange()!.getPiece()?.isWhite() != white) {
                        result.append(cube.getOrange()!)
                    }
                 }
                if ctype != 2 {
                    if (cube.getPurple()!.getPiece()?.isWhite() != white) {
                        result.append(cube.getPurple()!)
                    }
                }
                if (r < 5) {
                    if (game.getCubes()[r+1][c]?.getPurple())!.getPiece()?.isWhite() != white {
                        result.append((game.getCubes()[r+1][c]?.getPurple())!)
                    }
                }
                if r < 5 && c < 5 {
                    if (game.getCubes()[r+1][c+1]?.getOrange())!.getPiece()?.isWhite() != white {
                        result.append((game.getCubes()[r+1][c+1]?.getOrange())!)
                    }
                }
            break
                
            case 3:
                if ctype != 3 {
                       if (cube.getYellow()!.getPiece()?.isWhite() != white) {
                           result.append(cube.getYellow()!)
                       }
                }
                if ctype != 2 {
                     if (cube.getPurple()!.getPiece()?.isWhite() != white) {
                         result.append(cube.getPurple()!)
                     }
                }
                if r > 0 && c > 0 {
                    if (game.getCubes()[r-1][c-1]?.getYellow())!.getPiece()?.isWhite() != white {
                        result.append((game.getCubes()[r-1][c-1]?.getYellow())!)
                    }
                }
                if c > 0 {
                    if (game.getCubes()[r][c-1]?.getPurple())!.getPiece()?.isWhite() != white {
                        result.append((game.getCubes()[r][c-1]?.getPurple())!)
                    }
                }
            break
                
            default:
            break
            
        }
        
        return result
    
    }
    
    func getPossibleEMovesPawn() -> [Rhombus] {
        let game = self.rhombus.getCube().getGame()
        let r = self.rhombus.getCube().getR()
        let c = self.rhombus.getCube().getC()
        let cube = self.rhombus.getCube()
        var result: [Rhombus] = []
        let ctype = self.rhombus.getCube().getType() // w orange = 1, w purple = 2, w yellow = 3, all = 4
        if (white) {
            switch self.rhombus.getType() {
                case 1:
                    if ctype != 3 {
                        if (cube.getYellow()!.getPiece()?.isWhite() != white) {
                            result.append(cube.getYellow()!)
                        }
                    }
                break
                    
                case 2:
                    if (r < 5) {
                        if (game.getCubes()[r+1][c]?.getPurple())!.getPiece()?.isWhite() != white {
                            result.append((game.getCubes()[r+1][c]?.getPurple())!)
                        }
                    }
                    if r < 5 && c < 5 {
                        if (game.getCubes()[r+1][c+1]?.getOrange())!.getPiece()?.isWhite() != white {
                            result.append((game.getCubes()[r+1][c+1]?.getOrange())!)
                        }
                    }
                break
                    
                case 3:
                    if ctype != 3 {
                           if (cube.getYellow()!.getPiece()?.isWhite() != white) {
                               result.append(cube.getYellow()!)
                           }
                    }
                break
                    
                default:
                break
                
            }
        } else {
            switch self.rhombus.getType() {
                case 1:
                    if (r > 0) {
                        if (game.getCubes()[r-1][c]?.getYellow())!.getPiece()?.isWhite() != white {
                            result.append((game.getCubes()[r-1][c]?.getYellow())!)
                        }
                    }
                break
                    
                case 2:
                    if ctype != 1 {
                        if (cube.getOrange()!.getPiece()?.isWhite() != white) {
                            result.append(cube.getOrange()!)
                        }
                     }
                    if ctype != 2 {
                        if (cube.getPurple()!.getPiece()?.isWhite() != white) {
                            result.append(cube.getPurple()!)
                        }
                    }
                break
                    
                case 3:
                    if r > 0 && c > 0 {
                        if (game.getCubes()[r-1][c-1]?.getYellow())!.getPiece()?.isWhite() != white {
                            result.append((game.getCubes()[r-1][c-1]?.getYellow())!)
                        }
                    }
                break
                    
                default:
                break
                
            }
        }
        return result
    
    }
    
    
    func getPossibleEMovesPawn2Step() -> [Rhombus] {
        let game = self.rhombus.getCube().getGame()
        let r = self.rhombus.getCube().getR()
        let c = self.rhombus.getCube().getC()
        let cube = self.rhombus.getCube()
        var result: [Rhombus] = []
        let ctype = self.rhombus.getCube().getType() // w orange = 1, w purple = 2, w yellow = 3, all = 4
        if (white) {
            switch self.rhombus.getType() {
                case 1:
                    if ctype != 3 {
                        if (cube.getYellow()!.getPiece()?.isWhite() != white) {
                            result.append(cube.getYellow()!)
                            result.append((game.getCubes()[r+1][c]?.getPurple())!)
                        }
                    }
                break
                    
                case 3:
                    if ctype != 3 {
                           if (cube.getYellow()!.getPiece()?.isWhite() != white) {
                               result.append(cube.getYellow()!)
                               result.append((game.getCubes()[r+1][c+1]?.getOrange())!)
                           }
                    }
                break
                    
                default:
                break
                
            }
        } else {
            switch self.rhombus.getType() {
                case 1:
                    if (r > 0) {
                        if (game.getCubes()[r-1][c]?.getYellow())!.getPiece()?.isWhite() != white {
                            result.append((game.getCubes()[r-1][c]?.getYellow())!)
                            result.append((game.getCubes()[r-1][c]?.getPurple())!)
                        }
                    }
                break
                    
                case 3:
                    if r > 0 && c > 0 {
                        if (game.getCubes()[r-1][c-1]?.getYellow())!.getPiece()?.isWhite() != white {
                            result.append((game.getCubes()[r-1][c-1]?.getYellow())!)
                            result.append((game.getCubes()[r-1][c-1]?.getOrange())!)
                        }
                    }
                break
                    
                default:
                break
                
            }
        }
        return result
    
    }
    
    

    
}
