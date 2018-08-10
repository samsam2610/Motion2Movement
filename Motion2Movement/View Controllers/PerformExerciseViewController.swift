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
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!

    var exercise: ExerciseData!
    var timer = Timer()

    // MARK: - View Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()

        setUpCircularProgress()
        animateCircularProgress()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    // MARK: - Functions and Methods
    fileprivate func setUpView() {
        exerciseLabel.text = exercise.exerciseName
    }

    // MARK: Circular Progress Functions
    fileprivate func setUpCircularProgress() {
        circularProgress.startAngle = -90
        circularProgress.progressThickness = 0.2
        circularProgress.trackThickness = 0.6
        circularProgress.clockwise = true
        circularProgress.gradientRotateSpeed = 2
        circularProgress.roundedCorners = false
        circularProgress.glowMode = .noGlow
        // circularProgress.glowAmount = 0.9
        circularProgress.set(colors: UIColor.cyan, UIColor.blue)
    }

    fileprivate func animateCircularProgress() {
        let completion: ((Bool) -> Void) = { [weak self] _ in
            self?.animateCircularProgress()
        }

        circularProgress.animate(fromAngle: 0.0, toAngle: 360.0, duration: TimeInterval(exactly: 30)!, completion: completion)
    }

     // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "instructionsSegue" {
            guard let detailView = segue.destination as? ExerciseDetailViewController else { return }
            detailView.exercise = exercise
        }
    }

}
