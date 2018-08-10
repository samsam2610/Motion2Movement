//
//  PerformExerciseViewController.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 8/10/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class PerformExerciseViewController: UIViewController {

    // MARK: - Properties and Outlets
    @IBOutlet weak var circularProgress: KDCircularProgress!

    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCircularProgress()

        animateCircularProgress()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)


    }

    // MARK: - Functions and Methods
    fileprivate func setUpCircularProgress() {
        circularProgress.startAngle = -90
        circularProgress.progressThickness = 0.2
        circularProgress.trackThickness = 0.6
        circularProgress.clockwise = true
        circularProgress.gradientRotateSpeed = 2
        circularProgress.roundedCorners = false
        circularProgress.glowMode = .noGlow
//        circularProgress.glowAmount = 0.9
        circularProgress.set(colors: UIColor.cyan, UIColor.blue)
    }

    fileprivate func animateCircularProgress() {
        let completion: ((Bool) -> Void) = { [weak self] _ in
            self?.animateCircularProgress()
        }

        circularProgress.animate(fromAngle: 0.0, toAngle: 360.0, duration: TimeInterval(exactly: 30)!, completion: completion)
    }

}
