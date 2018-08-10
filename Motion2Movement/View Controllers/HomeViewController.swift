//
//  HomeViewController.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/11/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var exerciseLabel: UILabel!

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var exerciseViewModel: ExerciseGuideViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SWRevealViewControllerSettings.setUpSideBar(self)
        exerciseViewModel = appDelegate.exerciseViewModel
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkName()
    }

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
        if segue.identifier == "selectSegue" {
            let exerciseGuide = segue.destination as! ExerciseGuideTableViewController
            exerciseGuide.didAppearFromSelectSegue = true
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
