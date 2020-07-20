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

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Image(systemName: "doc.append")
          .foregroundColor(.red)
          .font(.title)
          .padding(.trailing, 10)
        Text(movement.name)
          .bold()
        Text(movement.measurement)
          .italic()
      }
      Spacer()
      Divider()
      Spacer()

      if self.scores.count > 0 {
        HStack {
          List {
            ForEach(self.scores, id: \.self) { score in
              NavigationLink(destination: MovementScoreDetail(movement: self.movement, score: score)) {
                MovementScoreRow(score: score)
              }
            }
          }
        }
      } else {
        Text("No scores yet..").italic()
      }
    }
    .onAppear {
      if self.globalState.accessToken != "" {
        self.getMovementScores()
      }
    }
    .navigationBarTitle(Text("Details"))
    .padding()
  }
}

struct MovementDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovementDetail(movement: Movement(movement_id: "1", name: "Bench Press", measurement: "weight", created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000"))
      .environmentObject(GlobalState())
  }
}
