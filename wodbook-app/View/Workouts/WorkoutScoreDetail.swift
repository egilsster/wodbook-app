//
//  WorkoutScoreDetail.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct WorkoutScoreDetail: View {
  @EnvironmentObject private var globalState: GlobalState
  var workout: Workout
  var score: WorkoutScore

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(workout.name).bold()
        Text(workout.measurement).italic()
      }

      Divider()

      Text(score.score)
      Text(score.rx ? "Rx" : "")

      Spacer()

      Text("Notes")
      Text(score.notes)
    }
    .navigationBarTitle(Text("Score"))
    .padding()
  }
}

struct WorkoutScoreDetail_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutScoreDetail(workout: Workout(workout_id: "1", name: "Angie", measurement: "time", description: "Description...", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"), score: WorkoutScore(workout_score_id: "2", workout_id: "1", score: "2:11", rx: true, notes: "Notes..", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .environmentObject(GlobalState())
  }
}
