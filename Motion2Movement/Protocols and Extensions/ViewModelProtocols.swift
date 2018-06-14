//
//  ViewModelProtocols.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/13/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import Foundation

protocol ExerciseGuideViewModel {
    var exercises: [String] { get set }

    func loadDummyData(_ completion: @escaping () -> ())
    func getExerciseName(atRow indexPath: IndexPath) -> String
}
