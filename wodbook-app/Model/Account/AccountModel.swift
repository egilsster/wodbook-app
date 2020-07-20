//
//  AccountModel.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

struct Account: Codable {
  var user_id: String
  var email: String
  var password: String
  var admin: Bool
  var first_name: String
  var last_name: String
  var date_of_birth: String
  var height: Int
  var weight: Int
  var box_name: String
  var avatar_url: String
}
