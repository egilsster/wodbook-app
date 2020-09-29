//
//  MovementDetail.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct MovementDetail: View {
  @EnvironmentObject private var globalState: GlobalState
  @State private var showModal: Bool = false
  @State private var scores: [MovementScore] = []
  @State var movement: Movement

  func getMovementScores() {
    MovementAPI.getMovementScores(movement.movement_id, nil) { res in
      if let json = res.value {
        let decoder = JSONDecoder()

        do {
          let details = try decoder.decode(MovementDetails.self, from: json.rawData())
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
          Text("For " + movement.measurement).italic()
        }

        Section(header: Text("Scores").font(.headline)) {
          if scores.count == 0 {
            Text("No scores logged").disabled(true)
          } else {
            ForEach(self.scores, id: \.self) { score in
              NavigationLink(destination: MovementScoreDetail(movement: self.movement, score: score)) {
                MovementScoreRow(measurement: self.movement.measurement, score: score)
              }
            }
          }
        }
      }
    }
    .listStyle(GroupedListStyle())
    .environment(\.horizontalSizeClass, .regular)
    .onAppear {
      if self.globalState.accessToken != "" {
        self.getMovementScores()
      }
    }.sheet(isPresented: $showModal, onDismiss: {
      self.getMovementScores()
    }, content: {
      CreateMovementScore(movement: self.movement)
    })
    .navigationBarTitle(Text(movement.name))
    .navigationBarItems(trailing: createScore)
  }
}

struct MovementDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovementDetail(movement: Movement(movement_id: "1", name: "Bench Press", measurement: "weight", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .environmentObject(GlobalState())
  }
}
