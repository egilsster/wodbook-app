//
//  CreateMovementScore.swift
//  wodbook-app
//
//  Created by Egill on 15/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct CreateMovementScore: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @ObservedObject var score = NewMovementScore()

  @State var movement: Movement

  var disableForm: Bool {
    score.score.count == 0
  }

  var body: some View {
    NavigationView {
      VStack {
        Form {
          MovementScoreInput(movement: self.movement, score: self.score)

          Section(header: Text("Notes")) {
            TextField("Notes", text: $score.notes).lineLimit(20)
          }

          Section {
            HStack {
              Button(action: {
                MovementAPI.createScore(self.movement.movement_id, self.score.getPayload()) { res in
                  switch res {
                  case .success:
                    // Notify somehow
                    self.presentation.wrappedValue.dismiss()
                  case let .failure(error):
                    print(error)
                  }
                }
              }, label: {
                HStack {
                  Text("Create")
                }
                  })
            }
          }
          .disabled(disableForm)
        }
      }.navigationBarTitle(Text("New Movement Score"), displayMode: .inline).navigationBarItems(leading:
        Button("Cancel") {
          self.presentation.wrappedValue.dismiss()
      })
    }
  }
}

struct CreateMovementScore_Previews: PreviewProvider {
  static var previews: some View {
    CreateMovementScore(movement: Movement(movement_id: "1", name: "Bench Press", measurement: "weight", is_public: true, created_at: "2020-04-06T07:00:00.000", updated_at: "2020-04-06T07:00:00.000")).environmentObject(GlobalState())
  }
}
