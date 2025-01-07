//
//  WorkutScore.swift
//  Betus2
//
//  Created by Gio's Mac on 27.12.24.
//

import UIKit

struct WorkoutScore: Codable {
    let workoutDate: String
    var soccerWorkoutCount: Int
    var basketballWorkoutCount: Int
    var volleyballWorkoutCount: Int
    var tennisWorkoutCount: Int

    enum CodingKeys: String, CodingKey {
        case workoutDate = "workout_date"
        case soccerWorkoutCount = "soccer_workout_count"
        case basketballWorkoutCount = "basketball_workout_count"
        case volleyballWorkoutCount = "volleyball_workout_count"
        case tennisWorkoutCount = "tennis_workout_count"
    }
}
