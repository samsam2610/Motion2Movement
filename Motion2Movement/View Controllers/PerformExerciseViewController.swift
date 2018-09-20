//
//  PerformExerciseViewController.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 8/10/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class PerformExerciseViewController: UIViewController {

    // TODO: - Refactor into View Model

    // MARK: - Properties and Outlets
    @IBOutlet weak var circularProgress: KDCircularProgress!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!

    // Labels
    @IBOutlet weak var repCounterLabel: UILabel!
    @IBOutlet weak var repWordLabel: UILabel!
    @IBOutlet weak var setCounterLabel: UILabel!
    @IBOutlet weak var setWordLabel: UILabel!
    @IBOutlet weak var romLabel: UILabel!

    var exercise: ExerciseData!
    var activity: Activity?
    var timer = Timer()
    var angles: [Double]!
    var repCounter = 0
    var reps: Int!

    // MARK: - View Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpView()
        setUpCircularProgress()

        // MARK: - Demo
        reps = exercise.suggestedReps ?? 10
        angles = setupAngles(reps)
        animateCircularProgress(repCounter)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    // MARK: - Functions and Methods
    fileprivate func setUpView() {
        exerciseLabel.text = exercise.exerciseName
        repCounterLabel.text = exercise.suggestedReps ?? 0 > 0 ? "0 of \(exercise.suggestedReps!)" : "0"
        setCounterLabel.text = "0 of \(exercise.suggestedSets ?? 0)"
    }

    // MARK: Circular Progress Functions
    func setupAngles(_ reps: Int) -> [Double] {
        var angles = [Double]()
        let angleToAdd = Double(360 / reps)

        for x in 1...reps {
            angles.append(angleToAdd * Double(x))
        }

        return angles
    }

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

    fileprivate func animateCircularProgress(_ repCount: Int) {
        let completion: ((Bool) -> Void) = { [weak self] _ in
            self?.repCounter += 1
            self?.repCounterLabel.text = "\(self?.repCounter ?? 0) of \(self?.exercise.suggestedReps ?? 0)"
        }

        circularProgress.animate(toAngle: angles[repCount], duration: TimeInterval(exactly: 1)!, relativeDuration: true, completion: completion)

    }

     // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "instructionsSegue" {
            guard let detailView = segue.destination as? ExerciseDetailViewController else { return }
            detailView.exercise = exercise
        }
    }

}
