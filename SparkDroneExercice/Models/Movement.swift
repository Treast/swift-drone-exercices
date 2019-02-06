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
        case Stop, Front, Left, Right, Back, FrontLeft, FrontRight, BackRight, BackLeft, Up, Down
        
        func value() -> Point3D {
            switch self {
            case .Stop:
                return Point3D(x: 0, y: 0, z: 0)
            case .Front:
                return Point3D(x: 0, y: 0, z: 1)
            case .Left:
                return Point3D(x: -1, y: 0, z: 0)
            case .Right:
                return Point3D(x: 1, y: 0, z: 0)
            case .Back:
                return Point3D(x: 0, y: 0, z: -1)
            case .FrontLeft:
                return Point3D(x: -1, y: 0, z: 1)
            case .FrontRight:
                return Point3D(x: 1, y: 0, z: 1)
            case .BackRight:
                return Point3D(x: 1, y: 0, z: -1)
            case .BackLeft:
                return Point3D(x: -1, y: 0, z: -1)
            case .Up:
                return Point3D(x: 0, y: 1, z: 0)
            case .Down:
                return Point3D(x: 0, y: -1, z: 0)
            }
        }
    }
    
    func description() -> String {
        return "\(self.direction.rawValue) during \(duration)"
    }
}
