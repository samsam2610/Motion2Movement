//
//  HomeViewController.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/11/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties and Outlets
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var exerciseLabel: UILabel!

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var exerciseViewModel: ExerciseGuideViewModel!

    // MARK: - View Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SWRevealViewControllerSettings.setUpSideBar(self)
        exerciseViewModel = appDelegate.exerciseViewModel
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkName()
    }

    // MARK: - Functions and Methods
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        exerciseViewModel.setSelectedExercise(nil)
        checkName()
    }

    func checkName() {
        if let exercise = exerciseViewModel.getSelectedExercise()?.exerciseName {
            exerciseLabel.text = "\(exercise) selected"
            startButton.isHidden = false
            selectButton.isHidden = true
            clearButton.isHidden = false
        } else {
            exerciseLabel.text = "No exercise selected"
            startButton.isHidden = true
            selectButton.isHidden = false
            clearButton.isHidden = true
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "selectSegue":
            guard let exerciseGuide = segue.destination as? ExerciseGuideTableViewController else { return }
            exerciseGuide.didAppearFromSelectSegue = true
        case "performSegue":
            guard let performView = segue.destination as? PerformExerciseViewController else { return }
            performView.exercise = exerciseViewModel.selectedExercise
        default:
            break
        }
    }

}
