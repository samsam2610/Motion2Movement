//
//  exerciseData.swift
//  M2M
//
//  Created by Tran Sam on 2/20/18.
//  Copyright © 2018 Tran Sam. All rights reserved.
//

import Foundation

struct ExerciseData: ExerciseInfo, ExerciseParam, Codable {
    var id: String?
    var exerciseName: String
    var description: String?
    var thighAngle_min: Int16
    var thighAngle_max: Int16
    var legAngle_max: Int16
    var legAngle_min: Int16
    var suggestedReps: Int?
    var suggestedSets: Int?
//    var instructions: Instruction?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case exerciseName = "title"
        case description = "description"
        case thighAngle_min = "thigh_angle_min"
        case thighAngle_max = "thigh_angle_max"
        case legAngle_min = "leg_angle_min"
        case legAngle_max = "leg_angle_max"
        case suggestedReps = "suggested_reps"
        case suggestedSets = "suggested_sets"
//        case instructions = "instructions"
    }

    init(toJson exerciseName: String, _ description: String?, _ thighAngle_min: Int16, _ thighAngle_max: Int16, _ legAngle_min: Int16, _ legAngle_max: Int16, _ suggestedReps: Int?, _ suggestedSets: Int?) {
        self.exerciseName = exerciseName
        self.description = description
        self.thighAngle_min = thighAngle_min
        self.thighAngle_max = thighAngle_max
        self.legAngle_min = legAngle_min
        self.legAngle_max = legAngle_max
        self.suggestedReps = suggestedReps
        self.suggestedSets = suggestedSets
//        self.instructions = instructions
    }
}

struct Instruction: ExerciseInstruction, Codable {
    var description: String
    var link: URL?

    private enum CodingKeys: String, CodingKey {
        case description = "text"
        case link
    }
    
    init(toJson description: String, link: URL?) {
        self.description = description
        self.link = link
    }

}
