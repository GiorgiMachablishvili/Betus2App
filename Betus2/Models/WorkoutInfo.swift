//
//  WorkoutInfo.swift
//  Betus2
//
//  Created by Gio's Mac on 12.01.25.
//

import UIKit

struct WorkoutInfo: Codable {
    let workoutDate: String
    let soccerWorkoutCount: Int
    let basketballWorkoutCount: Int
    let volleyballWorkoutCount: Int
    let tennisWorkoutCount: Int

    enum CodingKeys: String, CodingKey {
        case workoutDate = "workout_date"
        case soccerWorkoutCount = "soccer_workout_count"
        case basketballWorkoutCount = "basketball_workout_count"
        case volleyballWorkoutCount = "volleyball_workout_count"
        case tennisWorkoutCount = "tennis_workout_count"
    }
}
