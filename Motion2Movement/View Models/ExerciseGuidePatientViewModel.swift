//
//  ExerciseGuidePatientViewModel.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/13/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import Foundation

class ExerciseGuidePatientViewModel: ExerciseGuideViewModel {


    var exercises = [String]()


    func loadDummyData(_ completion: @escaping () -> ()) {
        exercises = [
            "Handstand",
            "Leg Lifts"
        ]
    }

    func getExerciseName(atRow indexPath: IndexPath) -> String {
        return exercises[indexPath.row]
    }
}
