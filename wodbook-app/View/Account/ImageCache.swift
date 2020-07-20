//
//  ImageCache.swift
//  wodbook-app
//
//  Created by Egill on 20/07/2020.
//  Copyright © 2020 Egill. All rights reserved.
//

import UIKit

protocol ImageCache {
  subscript(_: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {
  private let cache = NSCache<NSURL, UIImage>()

  subscript(_ key: URL) -> UIImage? {
    get { cache.object(forKey: key as NSURL) }
    set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
  }
}
