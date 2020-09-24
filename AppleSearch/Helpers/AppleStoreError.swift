//
//  AppleStoreError.swift
//  AppleSearch
//
//  Created by Owen Barrott on 9/24/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import Foundation

enum AppleStoreError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode(Error)
    case unableToDecodeImage(Error)
}
