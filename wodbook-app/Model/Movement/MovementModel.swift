//
//  MovementModel.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

struct Movement: Codable, Hashable {
  var movement_id: String
  var name: String
  var measurement: String
  var created_at: String
  var updated_at: String
}

struct MovementDetails: Codable, Hashable {
  var movement_id: String
  var name: String
  var measurement: String
  var scores: [MovementScore]
  var created_at: String
  var updated_at: String
}

struct MovementList: Codable, Hashable {
  var data: [Movement]
}

struct MovementScore: Codable, Hashable {
  var movement_score_id: String
  var movement_id: String
  var score: String
  var reps: Int
  var sets: Int
  var distance: String
  var notes: String
  var created_at: String
  var updated_at: String
}
