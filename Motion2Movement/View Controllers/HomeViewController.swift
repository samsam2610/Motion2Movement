//
//  HomeViewController.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/11/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var exerciseLabel: UILabel!

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var exerciseViewModel: ExerciseGuideViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SWRevealViewControllerSettings.setUpSideBar(self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        exerciseViewModel = appDelegate.exerciseViewModel

        exerciseLabel.text = "\(exerciseViewModel?.getSelectedExercise()?.exerciseName ?? "No exercise") selected"
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

         exerciseViewModel = nil
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
