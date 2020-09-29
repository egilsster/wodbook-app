//
//  ProfileView.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import RemoteImage
import SwiftUI

struct ProfileView: View {
  @State var athlete: Account

  // Navigate to settings view
  var settings: some View {
    NavigationLink(destination: SettingsView()) {
      Image(systemName: "gear")
        .imageScale(.large)
    }
  }

  var body: some View {
    VStack(alignment: .leading) {
      Section {
        UserHeader(athlete: self.athlete)

        Divider()

        AthleteStats(athlete: self.athlete)
      }.padding(.leading).padding(.trailing).padding(.top)

      Spacer()
    }
    .navigationBarTitle(Text("Athlete"), displayMode: .inline)
    .navigationBarItems(trailing: settings)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(athlete: Account(user_id: "1", email: "test@wodbook.club", password: "pass", admin: false, first_name: "Egill", last_name: "Sveinbjörnsson", date_of_birth: "1991-12-06", height: 189, weight: 85000, box_name: "none", avatar_url: ""))
  }
}
