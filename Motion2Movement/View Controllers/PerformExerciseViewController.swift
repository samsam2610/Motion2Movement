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
    // TODO: - Add Rep and Set overflow logic

    // This VC attempts to detect each repetition of the movement.
    // Once it detects the threshold for a set (which is given by
    // the Exercise object that's passed into this VC), it should
    // reset the repCounter to zero and increment the setCounter by
    // 1. The countdown timer should trigger, and will continue
    // until it hits zero or if the user continues moving. This
    // process will repeat once the activity is prematurely marked
    // Completed or once the setCounter reaches the target amount
    // specified by the Exercise object.

    // MARK: - Properties and Outlets
    @IBOutlet weak var repCircularProgress: KDCircularProgress!
    @IBOutlet weak var setCircularProgress: KDCircularProgress!
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
    var repAngles: [Double]! 
    var setAngles: [Double]!
    var repCounter = 0
    var setCounter = 0
    var reps: Int!
    var sets: Int!

    private enum ExerciseMovementType {
        case rep, set
    }

    // MARK: - View Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpCircularProgress()

        // MARK: - Demo
        reps = exercise.suggestedReps ?? 10
        sets = exercise.suggestedSets ?? 5
        repAngles = setupAngles(reps)
        setAngles = setupAngles(sets)
        animateCircularProgress(.rep)
        animateCircularProgress(.set)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // TODO: - Turn off timer and save exercise.
    }

    // MARK: - Functions and Methods
    fileprivate func setUpView() {
        exerciseLabel.text = exercise.exerciseName
        repCounterLabel.text = exercise.suggestedReps ?? 0 > 0 ? "0 of \(exercise.suggestedReps!)" : "0"
        setCounterLabel.text = "0 of \(exercise.suggestedSets ?? 0)"
    }

    // MARK: Circular Progress Functions
    private func setUpCircularProgress() {
        repCircularProgress.startAngle = -90
        repCircularProgress.progressThickness = 0.2
        repCircularProgress.trackThickness = 0.4
        repCircularProgress.clockwise = true
        repCircularProgress.gradientRotateSpeed = 2
        repCircularProgress.roundedCorners = false
        repCircularProgress.glowMode = .noGlow
        // circularProgress.glowAmount = 0.9
        repCircularProgress.trackColor = .gray
        repCircularProgress.set(colors: UIColor.orange, UIColor.red)

        setCircularProgress.startAngle = -90
        setCircularProgress.progressThickness = 0.15
        setCircularProgress.trackThickness = 0.35
        setCircularProgress.clockwise = true
        setCircularProgress.gradientRotateSpeed = 2
        setCircularProgress.roundedCorners = false
        setCircularProgress.glowMode = .noGlow
        // circularProgress.glowAmount = 0.9
        setCircularProgress.trackColor = .gray
        setCircularProgress.set(colors: UIColor.cyan, UIColor.blue)
    }

    /**
     Animate the corresponding progress circle based on ExerciseMovementType.

     - parameters:
        - type: ExerciseMovementType to identify sets or reps
     */
    private func animateCircularProgress(_ type: ExerciseMovementType) {

        var completion: ((Bool) -> Void)!
        var angles: [Double]!
        var motionCounter: Int!
        var circularProgress: KDCircularProgress!

        let repCompletion: ((Bool) -> Void) = { [weak self] _ in
            self?.incrementRepCounter()
        }

        let setCompletion: ((Bool) -> Void) = { [weak self] _ in
            self?.setCounter += 1
            self?.setCounterLabel.text = "\(self?.setCounter ?? 0) of \(self?.exercise.suggestedSets ?? 0)"

            self?.triggerTimer {
                self?.incrementRepCounter(needsReset: true)
            }
        }

        if type == .rep {
            completion = repCompletion
            motionCounter = repCounter
            angles = repAngles
            circularProgress = repCircularProgress
        } else if type == .set {
            completion = setCompletion
            motionCounter = setCounter
            angles = setAngles
            circularProgress = setCircularProgress
        } else {
            return
        }

        circularProgress.animate(toAngle: angles[motionCounter], duration: TimeInterval(exactly: 0.5)!, relativeDuration: true, completion: completion)
    }

    /**
     Increments or resets the repCounter and corresponding labels.

     - parameters:
        - needsReset: If true, then reset the counter to 0 instead of incrementing.
     */
    private func incrementRepCounter(needsReset: Bool = false) {
        if needsReset {
            repCounter = 0
        } else {
            repCounter += 1
        }

        repCounterLabel.text = "\(repCounter) of \(exercise.suggestedReps ?? 0)"
    }

    /**
     Called when user performs a movement.
     */
    private func performRep() {
        if let maxReps = exercise.suggestedReps, let maxSets = exercise.suggestedSets {

            // This makes sure that sets are still incomplete
            guard setCounter < maxSets else {
                // TODO: Logic to stop and save exercise
                return
            }

            // This makes sure that reps for this set are still incomplete
            if repCounter < maxReps {
                animateCircularProgress(.rep)
            }
                // TODO: - If set is about to be completed...
            else {
                animateCircularProgress(.set)
            }
        }
    }

    private func resetCircle(_ type: ExerciseMovementType) {
        if type == .rep {
            // TODO: - Animate repCircle to zero and adjust labels
            repCircularProgress.animate(fromAngle: repAngles[repCounter], toAngle: 0, duration: TimeInterval(exactly: 0.5)!) { [weak self] _ in
                self?.incrementRepCounter(needsReset: true)
                self?.animateCircularProgress(.set)
            }
        } else {
            // TODO: - Animate setCircle to zero and adjust labels
        }
    }

    private func triggerTimer(_ completion: @escaping (() -> Void)) {
        // TODO: - Timer code
        completion()
    }

     // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "instructionsSegue" {
            guard let detailView = segue.destination as? ExerciseDetailViewController else { return }
            detailView.exercise = exercise
        }
    }

}
