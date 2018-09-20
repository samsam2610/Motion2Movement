//
//  Activity.swift
//  M2M
//
//  Created by Tran Sam on 2/20/18.
//  Copyright © 2018 Tran Sam. All rights reserved.
//

import Foundation

protocol ActivityParam: ExerciseInfo {
    var timeStart: String { get set }
    var timeEnd: String { get set }
    var duration: String { get set }
    var repetitions: Int { get set }
    var averageAngle: Float { get set }
    var minAngle: Float { get set }
    var maxAngle: Float { get set }

    // TODO: Add to backend
    var suggestedReps: Int? { get set }
    var suggestedSets: Int? { get set }
}

struct Activity: ActivityParam, Codable {
    var exerciseName: String
    var id: String
    var description: String?
    var assignmentID: String
    var userID: String
    var timeStart: String
    var timeEnd: String
    var duration: String
    var repetitions: Int
    var averageAngle: Float
    var minAngle: Float
    var maxAngle: Float
    var suggestedReps: Int?
    var suggestedSets: Int?

    private enum CodingKeys: String, CodingKey {
        case id
        case description
        case assignmentID = "assignment_id"
        case userID = "user_id"
        case exerciseName = "title"
        case timeStart = "time_start"
        case timeEnd = "time_end"
        case duration
        case repetitions
        case averageAngle = "average_angle"
        case minAngle = "min_angle"
        case maxAngle = "max_angle"
        case suggestedReps = "suggested_reps"
        case suggestedSets = "suggested_sets"
    }
}
