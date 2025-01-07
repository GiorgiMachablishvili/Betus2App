//
//  URL+Extension.swift
//  Betus2
//
//  Created by Gio's Mac on 07.01.25.
//

extension String {
    static func userCreate() -> String {
        let baseURL = "https://betus-workouts-98df47aa38c2.herokuapp.com/api/v1/users/"
        return "\(baseURL)"
    }

    static func userDelete(userId: String) -> String {
        let baseURL = "https://betus-workouts-98df47aa38c2.herokuapp.com/api/v1/users/"
        return "\(baseURL)\(userId)"
    }


    static func createWorkoutCountsAndDate(userId: String) -> String {
        let baseURL = "https://betus-workouts-98df47aa38c2.herokuapp.com/api/v1/workout_scores/?user_id="
        return "\(baseURL)\(userId)"
    }

    static func getWorkoutCountsAndDate(userId: String) -> String {
        let baseURL = "https://betus-workouts-98df47aa38c2.herokuapp.com/api/v1/workout_scores/"
        return "\(baseURL)\(userId)"
    }
}
