//
//  ViewModelProtocols.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/13/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import Foundation

protocol ExerciseGuideViewModel {
    var exercises: [ExerciseData] { get set }
    var selectedExercise: ExerciseData? { get set }

    func loadDummyData(_ completion: @escaping () -> ())
    func getExerciseName(atIndexPath indexPath: IndexPath) -> ExerciseData
    func cellIsSelected(_: ExerciseData) -> Bool
    func setSelectedExercise(_: ExerciseData?)
    func getSelectedExercise() -> ExerciseData?
}
