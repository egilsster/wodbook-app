//
//  UserHeader.swift
//  wodbook-app
//
//  Created by Egill on 18/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct UserHeader: View {
  @State var athlete: Account

  var body: some View {
    HStack(alignment: .center) {
      Avatar(avatarUrl: self.athlete.avatar_url)

      VStack(alignment: .leading) {
        Text(self.athlete.first_name + " " + self.athlete.last_name).font(.title)
        Text(self.athlete.email).font(.subheadline).foregroundColor(Color.secondary)
      }

      Spacer()
    }
  }
}

struct UserHeader_Previews: PreviewProvider {
  static var previews: some View {
    UserHeader(athlete: Account(user_id: "1", email: "test@wodbook.club", password: "pass", admin: false, first_name: "Egill", last_name: "Sveinbjörnsson", date_of_birth: "1991-12-06", height: 189, weight: 85000, box_name: "none", avatar_url: ""))
  }
}
