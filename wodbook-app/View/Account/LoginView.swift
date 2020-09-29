//
//  LoginView.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct LogInView: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @State private var showModal = false
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var remember: Bool = false

  var logInFormData: Parameters {
    [
      "email": email,
      "password": password,
      "remember_me": remember,
    ]
  }

  var body: some View {
    VStack {
      Text("LOG IN")
        .bold()
        .font(.largeTitle)
      Text("Wodbook")
        .font(.subheadline)

      TextField("Email", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(UITextAutocapitalizationType.none)
      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      Toggle(isOn: $remember) {
        Text("Remember")
      }.toggleStyle(SwitchToggleStyle())

      HStack {
        Button(action: {
          AccountAPI.login(self.logInFormData) { res in
            switch res {
            case .success:
              if let json = res.value, let accessToken = json["token"].string {
                self.globalState.accessToken = accessToken
              }
            case let .failure(error):
              print(error)
            }
          }
        }, label: {
          HStack {
            Image(systemName: "checkmark.circle")
            Text("Log In")
          }
          .foregroundColor(Color.white)
          .frame(width: 90, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })

        Button(action: {
          self.showModal = true
        }, label: {
          HStack {
            Image(systemName: "person.crop.circle.badge.plus")
            Text("Register")
          }
          .foregroundColor(Color.white)
          .frame(width: 110, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })
      }
    }
    .padding(48)
    .sheet(isPresented: $showModal, content: {
      RegisterView().environmentObject(self.globalState)
    })
  }
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView().environmentObject(GlobalState())
  }
}
