//
//  ExerciseDetailViewController.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 8/10/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class ExerciseDetailViewController: UIViewController {

    // MARK: - Properties and Outlets
    var exercise: ExerciseData!

    // MARK: - View Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = exercise.exerciseName
    }

    // MARK: - Functions and Methods

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
