//
//  ContentView.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var globalState: GlobalState

  var body: some View {
    if self.globalState.accessToken == "" {
      return AnyView(LogInView().environmentObject(self.globalState))
    }

    return AnyView(TabView {
      WorkoutView()
        .tabItem {
          Image(systemName: "list.dash")
          Text("Workouts")
        }

      MovementView()
        .tabItem {
          Image(systemName: "list.dash")
          Text("Movements")
        }

      ProfileView()
        .tabItem {
          Image(systemName: "person.crop.circle")
          Text("Athlete")
        }
     }.environmentObject(self.globalState))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(GlobalState())
  }
}
