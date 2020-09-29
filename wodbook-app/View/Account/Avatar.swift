//
//  Avatar.swift
//  wodbook-app
//
//  Created by Egill on 18/08/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import RemoteImage
import SwiftUI

struct FallbackImage: View {
  var body: some View {
    Rectangle()
      .fill(Color.red)
  }
}

struct Avatar: View {
  @State private var avatarSize: CGFloat = 65
  @State private var imageRadius: CGFloat = 10

  @State var avatarUrl: String

  var body: some View {
    Group {
      if self.avatarUrl == "" {
        FallbackImage()
      } else {
        RemoteImage(type: .url(URL(string: Constants.API_URL + self.avatarUrl)!), errorView: { _ in
          FallbackImage()
        }, imageView: { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
        }, loadingView: { FallbackImage() })
      }
    }
    .cornerRadius(self.imageRadius)
    .frame(width: self.avatarSize, height: self.avatarSize)
  }
}

struct Avatar_Previews: PreviewProvider {
  static var previews: some View {
    Avatar(avatarUrl: "")
  }
}
