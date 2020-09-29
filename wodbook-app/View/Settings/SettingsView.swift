//
//  SettingsView.swift
//  wodbook-app
//
//  Created by Egill on 06/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject private var globalState: GlobalState

  @State private var apperanceIndex = 0

  var body: some View {
    VStack {
      Form {
//        Section(header: Text("General")) {
//          Text("General settings..")
//        }

        Section(header: Text("About")) {
          HStack {
            Text("Version")
            Spacer()
            Text("0.0.1")
          }.foregroundColor(Color.secondary)
        }

        Section {
          Button(action: {
            self.globalState.accessToken = ""
            UserDefaults.standard.removeObject(forKey: "token")
          }, label: {
            Text("Sign Out").foregroundColor(Color.red)
          })
        }
      }
      .navigationBarTitle("Settings", displayMode: .inline)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView().environmentObject(GlobalState())
  }
}
