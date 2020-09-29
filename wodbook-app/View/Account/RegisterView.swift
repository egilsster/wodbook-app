//
//  RegisterView.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct RegisterView: View {
  @EnvironmentObject private var globalState: GlobalState
  @Environment(\.presentationMode) private var presentation: Binding<PresentationMode>

  @State private var email: String = ""
  @State private var password: String = ""

  func stateReset() {
    email = ""
    password = ""
  }

  var registerFormData: Parameters {
    [
      "email": email,
      "password": password,
    ]
  }

  var body: some View {
    VStack {
      Text("REGISTER")
        .bold()
        .font(.largeTitle)
      Text("Wodbook")
        .font(.subheadline)

      TextField("Email", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(UITextAutocapitalizationType.none)
      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      HStack {
        Button(action: {
          self.presentation.wrappedValue.dismiss()
        }, label: {
          HStack {
            Image(systemName: "xmark.circle")
            Text("Cancel")
          }
          .foregroundColor(Color.white)
          .frame(width: 95, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })

        Button(action: {
          AccountAPI.signup(self.registerFormData) { res in
            switch res {
            case .success:
              if let json = res.value, let accessToken = json["token"].string {
                self.globalState.accessToken = accessToken
              }
              self.stateReset()
              self.presentation.wrappedValue.dismiss()
            case let .failure(error):
              print(error)
            }
          }
        }, label: {
          HStack {
            Image(systemName: "checkmark.circle")
            Text("Sign Up")
          }
          .foregroundColor(Color.white)
          .frame(width: 110, height: 32)
          .background(Color.blue)
          .cornerRadius(5)
        })
      }
    }
    .padding(48)
  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView().environmentObject(GlobalState())
  }
}
