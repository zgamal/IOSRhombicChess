//
//  UIImageViewExt.swift
//  Paletta
//
//  Created by Z. Gamal on 5/26/21.
//  Copyright © 2021 Z. Gamal. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    struct Holder {
        static var _piece: Piece? = nil
    }
    
    var piece: Piece? {
        get {
            return Holder._piece
        }
        set(newPiece) {
            Holder._piece = newPiece
        }
    }
    
}
