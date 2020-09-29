//
//  WorkoutDetail.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct WorkoutDetail: View {
  @EnvironmentObject private var globalState: GlobalState
  @State private var showModal: Bool = false
  @State var workout: Workout
  @State private var scores: [WorkoutScore] = []

  func getWorkoutScores() {
    WorkoutAPI.getWorkoutScores(workout.workout_id, nil) { res in
      if let json = res.value {
        let decoder = JSONDecoder()

        do {
          let details = try decoder.decode(WorkoutDetails.self, from: json.rawData())
          self.scores = details.scores
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }

  var createScore: some View {
    Button(action: {
      self.showModal.toggle()
    }, label: {
      Image(systemName: "plus.circle")
        .imageScale(.large)
        })
  }

  var body: some View {
    List {
      Group {
        Section {
          Text("For " + workout.measurement).italic()
          Text(workout.description)
        }

        Section(header: Text("Scores").font(.headline)) {
          if scores.count == 0 {
            Text("No scores logged").disabled(true)
          } else {
            ForEach(self.scores, id: \.self) { score in
              NavigationLink(destination: WorkoutScoreDetail(workout: self.workout, score: score)) {
                WorkoutScoreRow(score: score)
              }
            }
          }
        }
      }
    }
    .listStyle(GroupedListStyle())
    .environment(\.horizontalSizeClass, .regular)
    .navigationBarTitle(Text(workout.name))
    .navigationBarItems(trailing: createScore)
    .onAppear {
      if self.globalState.accessToken != "" {
        self.getWorkoutScores()
      }
    }.sheet(isPresented: $showModal, onDismiss: {
      self.getWorkoutScores()
    }, content: {
      CreateWorkoutScore(workout: self.workout)
    })
  }
}

struct WorkoutDetail_Previews: PreviewProvider {
  static var previews: some View {
    WorkoutDetail(workout: Workout(workout_id: "1", name: "Angie", measurement: "time", description: "Description...", is_public: true, created_at: "2020-08-17T13:48:41.565949+00:00", updated_at: "2020-08-17T13:48:41.565949+00:00"))
      .environmentObject(GlobalState())
  }
}
