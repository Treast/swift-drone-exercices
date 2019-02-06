//
//  Movement.swift
//  fr.vincentriva.RivaVincentMentalist
//
//  Created by Digital on 11/01/2019.
//  Copyright © 2019 Digital. All rights reserved.
//

import Foundation
import UIKit

struct Movement {
    var direction: Direction
    var duration: CGFloat
    
    init(direction: Direction, duration: CGFloat) {
        self.direction = direction
        self.duration = duration
    }
    
    // Possibilité de rajouter une 3ème direction et des rotations
    enum Direction: String, CaseIterable {
        case Stop, Front, Left, Right, Back, FrontLeft, FrontRight, BackRight, BackLeft
        
        func value() -> CGPoint {
            switch self {
            case .Stop:
                return CGPoint(x: 0, y: 0)
            case .Front:
                return CGPoint(x: 0, y: 1)
            case .Left:
                return CGPoint(x: -1, y: 0)
            case .Right:
                return CGPoint(x: 1, y: 0)
            case .Back:
                return CGPoint(x: 0, y: -1)
            case .FrontLeft:
                return CGPoint(x: -1, y: 1)
            case .FrontRight:
                return CGPoint(x: 1, y: 1)
            case .BackRight:
                return CGPoint(x: 1, y: -1)
            case .BackLeft:
                return CGPoint(x: -1, y: -1)
            }
        }
    }
    
    func description() -> String {
        return "\(self.direction.rawValue) during \(duration)"
    }
}
