//
//  ScoreListView.swift
//  wodbook-app
//
//  Created by Egill on 18/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftlySearch
import SwiftUI

struct ScoreListView: View {
  @EnvironmentObject private var globalState: GlobalState

  @State private var itemType = 0
  @State private var searchText = ""

  var options = ["Movements", "Workouts"]

  func getUserInfo() {
    AccountAPI.info(nil) { res in
      if let json = res.value {
        let decoder = JSONDecoder()

        do {
          let userData = try decoder.decode(Account.self, from: json.rawData())
          self.globalState.userData = userData
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }

  var profileMenuItem: some View {
    NavigationLink(destination: ProfileView(athlete: self.globalState.userData)) {
      Image(systemName: "person.circle")
        .imageScale(.large)
    }
  }

  var body: some View {
    NavigationView {
      Group {
        Section {
          // Refactor filters into something reusable
          Picker("Filter", selection: self.$itemType) {
            ForEach(0 ..< options.count) {
              Text(self.options[$0])
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }.padding()

        List {
          if self.itemType == 0 {
            Text("Workout Score 1")
            Text("Workout Score 2")
            Text("Workout Score 3")
          } else {
            Text("Movement Score 1")
            Text("Movement Score 2")
            Text("Movement Score 3")
          }
        }
        // Needs some work to look good with the type filter
        // .navigationBarSearch(self.$searchText)
      }
      .navigationBarTitle("Scores")
      .navigationBarItems(leading: profileMenuItem)
      .onAppear {
        self.getUserInfo()
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    ScoreListView().environmentObject(GlobalState())
  }
}
