//
//  ProfileView.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject private var globalState: GlobalState
//  @Environment(\.imageCache) var cache: ImageCache
//  let url = URL(string: "https://avatars3.githubusercontent.com/u/5672257?s=460&u=14853eedcade1581de96ea11f752f61bb75e5c3c&v=4")!

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

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
//        AsyncImage(url: self.url, cache: self.cache, placeholder: Text("Loading ..."))
//          .frame(minHeight: 200, maxHeight: 200)
//          .aspectRatio(contentMode: .fit)
        Circle()
          .fill(Color.orange)
          .frame(width: 75, height: 75)

        VStack(alignment: .leading) {
          Text(globalState.userData.first_name + " " + globalState.userData.last_name).font(.title)
          Text(globalState.userData.email).font(.caption)
        }
      }.padding(.bottom)

      HStack {
        Text("Height:")
        Text(String(globalState.userData.height) + "cm")
        Text("Weight:")
        Text(String(globalState.userData.weight / 1000) + "kg")
      }.padding(.bottom)

      HStack {
        Text("Born:")
        Text(globalState.userData.date_of_birth)
      }.padding(.bottom)

      HStack {
        Text("Box:")
        Text(globalState.userData.box_name.count == 0 ? "unaffiliated" : globalState.userData.box_name)
      }

      Spacer()

      Button(action: {
        self.globalState.accessToken = ""
        UserDefaults.standard.removeObject(forKey: "token")
      }, label: {
        Image(systemName: "person.crop.circle.badge.xmark")
          .foregroundColor(.red)
          .font(.title)
          .padding(.leading, -5)
        Text("Logout")
          .foregroundColor(.red)
          .bold()
        })
        .padding()
    }
    .padding()
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    .onAppear {
      self.getUserInfo()
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
//    let gState = GlobalState()
//    gState.userData = Account(user_id: "1", email: "test@wodbook.club", password: "pass", admin: false, first_name: "Egill", last_name: "Egill Sveinbjörnsson", date_of_birth: "1991-12-06", height: 189, weight: 85000, box_name: "none", avatar_url: "")
    ProfileView().environmentObject(GlobalState())
  }
}
