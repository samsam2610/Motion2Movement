//
//  UIViewController+Angles.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 9/20/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import Foundation

extension UIViewController {

    /**
     Calculates the angles that each rep/set will cover on the corresponding progress circle.

     - parameters:
        - movements: The amount of reps/sets

     - returns:
     An array of Doubles that are the starting point of each circle slice.
     */
    func setupAngles(_ movements: Int) -> [Double] {
        var angles = [Double]()
        let angleToAdd = Double(360 / movements)

        for x in 1...movements {
            angles.append(angleToAdd * Double(x))
        }

        return angles
    }

}
