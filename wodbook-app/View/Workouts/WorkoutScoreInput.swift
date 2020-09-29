//
//  WorkoutScoreInput.swift
//  wodbook-app
//
//  Created by Egill on 17/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct WorkoutScoreInput: View {
  @State var workout: Workout
  @State var score: NewWorkoutScore

  var body: some View {
    Section(header: Text("Score")) {
      if workout.measurement == "none" || workout.measurement == "unknown" {
        Text("No measurement")
      } else {
        if workout.measurement == "time" {
          HStack {
            TextField("Time", text: $score.score).keyboardType(.default)
            Text("min")

            Spacer()
          }
        } else if workout.measurement == "distance" {
          HStack {
            TextField("Distance", text: $score.score)
            Spacer()
          }
        } else if workout.measurement == "load" {
          HStack {
            TextField("Load", text: $score.score).keyboardType(.numberPad)
            Text("kg")

            Spacer()
          }
        } else if workout.measurement == "repetitions" {
          HStack {
            TextField("Reps", text: $score.score).keyboardType(.numberPad)
            Text("reps")

            Spacer()
          }
        } else if workout.measurement == "rounds" {
          HStack {
            TextField("Rounds", text: $score.score).keyboardType(.numberPad)
            Text("rounds")

            Spacer()
          }
        } else if workout.measurement == "tabata" {
          HStack {
            TextField("", text: $score.score).keyboardType(.numberPad)
            Text("?")

            Spacer()
          }
        } else if workout.measurement == "timed_rounds" {
          HStack {
            TextField("", text: $score.score).keyboardType(.numberPad)
            Text("?")

            Spacer()
          }
        } else if workout.measurement == "total" {
          HStack {
            TextField("", text: $score.score).keyboardType(.numberPad)
            Text("kg")

            Spacer()
          }
        }
      }

      Toggle(isOn: $score.rx) {
        Text("Rx")
      }.toggleStyle(SwitchToggleStyle())
    }
  }
}

struct WorkoutScoreInput_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutScoreInput(workout: Workout(workout_id: "1", name: "Angie", measurement: "time", description: "Description...", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"), score: NewWorkoutScore())
  }
}
