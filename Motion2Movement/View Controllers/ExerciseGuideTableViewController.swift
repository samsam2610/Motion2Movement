//
//  ExerciseGuideTableViewController.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/13/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class ExerciseGuideTableViewController: UITableViewController {

    // MARK: - Properties and Outlets
    var viewModel: ExerciseGuideViewModel!
    var didAppearFromSelectSegue: Bool?
    var selectedIndexPath: IndexPath?

    // MARK: - View Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSideBar()

        let nib = UINib.init(nibName: "ExerciseGuideTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "exerciseCell")

        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        viewModel = appDelegate.exerciseViewModel

        viewModel.loadDummyData() {
            self.tableView.reloadData()
        }

        self.clearsSelectionOnViewWillAppear = false

        if let _ = didAppearFromSelectSegue {
            self.title = "Select Exercise"
        }
    }

    // MARK: - Functions and Methods
    @objc func selectExercise(_ sender: UIButton) {
        print(sender.state)
        if sender.state == UIControlState(rawValue: 5) {
            viewModel.setSelectedExercise(nil)
             showToast("Deselected")
        } else {
            let checkedExercise = viewModel.exercises[sender.tag]

            viewModel.setSelectedExercise(checkedExercise)
            showToast("\(checkedExercise.exerciseName) selected")
        }

        print(viewModel.selectedExercise ?? "Not selected")

        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.exercises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseGuideTableViewCell
        let exercise = viewModel.getExerciseName(atIndexPath: indexPath)
        var statusString = ""
//        var statusString = "3 sets      8 reps      100 ROM      8 min"

        statusString += "\(exercise.suggestedSets ?? 0) sets     \(exercise.suggestedReps ?? 0) reps      \(abs(Int32(exercise.legAngle_max - exercise.legAngle_min) - Int32(exercise.thighAngle_max - exercise.thighAngle_min))) ROM"

        cell.exerciseNameLabel.text = exercise.exerciseName
        cell.exerciseStatusLabel.text = statusString
        cell.checkButton.tag = indexPath.row

        // Show that exercise is selected in cell.
        cell.checkButton.isSelected = viewModel.cellIsSelected(exercise)
        cell.checkButton.addTarget(self, action: #selector(selectExercise(_:)), for: .touchUpInside)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _ = didAppearFromSelectSegue {
            let exerciseName = viewModel.getExerciseName(atIndexPath: indexPath)

            viewModel.setSelectedExercise(exerciseName)

            self.navigationController?.popViewController(animated: true)
        } else {
            // TODO: Perform Segue to Exercise Info
            selectedIndexPath = indexPath
            performSegue(withIdentifier: "exerciseSegue", sender: self)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exerciseSegue", let detailView = segue.destination as? ExerciseDetailViewController, let indexPath = selectedIndexPath {
            detailView.exercise = viewModel.getExerciseName(atIndexPath: indexPath)
        }
    }


}
