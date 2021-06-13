//
//  ViewController.swift
//  Paletta
//
//  Created by Z. Gamal on 5/17/21.
//  Copyright © 2021 Z. Gamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var game: Game = Game()
    private var selected: Piece?
    private var possibles: [Rhombus]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game.buildPieces()
        for row in game.getCubes() {
            for cube in row {
                if (cube != nil) {
                    for rhombus in cube!.rhombuses {
                        if (!rhombus.isOpen()) {
                            rhombus.getPiece()?.getImage().isUserInteractionEnabled = true
                            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                            rhombus.getPiece()?.getImage().addGestureRecognizer(tapRecognizer)
                            view.addSubview((rhombus.getPiece()?.getImage())!)
                        }
                        rhombus.getCircle().isUserInteractionEnabled = true
                        let tapRecognizerC = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
                        rhombus.getCircle().addGestureRecognizer(tapRecognizerC)
                        view.addSubview(rhombus.getCircle())
                        view.bringSubviewToFront(rhombus.getCircle())
                    }
                }
            }
        }
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        let imageView = recognizer.view as? UIImageView
        if imageView != nil {
            for row in game.getCubes() {
                for cube in row {
                    if (cube != nil) {
                        for rhombus in cube!.rhombuses {
                            if (rhombus.getPiece()?.getImage() == imageView) {
                                if (game.isWhite() == rhombus.getPiece()?.isWhite()) {
                                    if (possibles != nil) {
                                          for possible in possibles! {
                                              possible.getCircle().isHidden = true
                                          }
                                    }
                                    self.selected = rhombus.getPiece()
                                    self.possibles = (selected?.findMoves())!
                                    for rhombus in possibles! {
                                        rhombus.getCircle().isHidden = false
                                        view.bringSubviewToFront(rhombus.getCircle())
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc func circleTapped(recognizer: UITapGestureRecognizer) {
        let imageView = recognizer.view as? UIImageView
        if imageView != nil {
            for row in game.getCubes() {
                for cube in row {
                    if (cube != nil) {
                        for rhombus in cube!.rhombuses {
                            if (rhombus.getCircle() == imageView) {
                                print(1)
                                selected?.getRhombus().clear()
                                rhombus.setPiece(piece: selected!)
                                selected?.setRhombus(rhombus: rhombus)
                                for possible in possibles! {
                                    possible.getCircle().isHidden = true
                                }
                                self.possibles = nil
                                selected = nil
                                game.toggleWhite()
                                game.flipPieces()
                            }
                        }
                    }
                }
            }
        }
        


    }

    
}
