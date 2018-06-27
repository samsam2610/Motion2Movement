//
//  ExerciseGuidePatientViewModel.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/13/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import Foundation

class ExerciseGuidePatientViewModel: ExerciseGuideViewModel {

    var exercises = [ExerciseData]()
    internal var selectedExercise: ExerciseData?

    func loadDummyData(_ completion: @escaping () -> ()) {
        exercises = [
            ExerciseData(toJson: "Walking", "Take a few steps", 10, 20, 10, 20),
            ExerciseData(toJson: "Leg lifts", "Lift your leg", 10, 20, 10, 20)
        ]
    }

    func getExerciseName(atIndexPath indexPath: IndexPath) -> ExerciseData {
        return exercises[indexPath.row]
    }

    func cellIsSelected(_ exercise: ExerciseData) -> Bool {
        guard let selectedExercise = selectedExercise else { return false }

        if exercise.exerciseName == selectedExercise.exerciseName {
            return true
        }

        return false
    }

    func setSelectedExercise(_ exercise: ExerciseData?) {
        selectedExercise = exercise
    }

    func getSelectedExercise() -> ExerciseData? {
        return selectedExercise
    }
}
