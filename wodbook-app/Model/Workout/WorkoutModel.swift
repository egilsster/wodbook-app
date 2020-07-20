//
//  WorkoutModel.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

struct Workout: Codable, Hashable {
  var workout_id: String
  var name: String
  var measurement: String
  var description: String
  var created_at: String
  var updated_at: String
}

struct WorkoutDetails: Codable, Hashable {
  var workout_id: String
  var name: String
  var measurement: String
  var description: String
  var scores: [WorkoutScore]
  var created_at: String
  var updated_at: String
}

struct WorkoutList: Codable, Hashable {
  var data: [Workout]
}

struct WorkoutScore: Codable, Hashable {
  var workout_score_id: String
  var workout_id: String
  var score: String
  var rx: Bool
  var notes: String
  var created_at: String
  var updated_at: String
}
